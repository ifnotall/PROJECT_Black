Shader "Archipin/FX/Fx_Particle_Basic_URP"
{
    Properties
    {
        _TintColor("Color", Color) = (1,1,1,1)
        _MainTex("Texture", 2D) = "white" {}
        _AlphaTex("AlphaTex", 2D) = "white" {}
        _AddInt("AddInt", float) = 1

        [Space(20)]

		[Enum(UnityEngine.Rendering.BlendMode)] _SrcBlend("SrcBlend mode", Float) = 1
		[Enum(UnityEngine.Rendering.BlendMode)] _DstBlend("DstBlend mode", Float) = 1
		[Toggle] _Zwrite ("Zwrite", float) = 0
		[Toggle] _Cull ("Cull", float) = 0

    }

    SubShader
    {

      Tags {  "RenderPipeline"="UniversalPipeline" "RenderType"="Transparent" "Queue"="Transparent+900"}
        LOD 100
	    Blend[_SrcBlend][_DstBlend]
		ZWrite[_Zwrite]
		Cull[_Cull]

        Pass
        {
           HLSLPROGRAM
            #pragma prefer_hlslcc gles
            #pragma exclude_renderers d3d11_9x
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_fog

           #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
            

            CBUFFER_START(UnityPerMaterial)
                float4 _TintColor;
                sampler2D _MainTex;
                sampler2D _AlphaTex;
                float4 _MainTex_ST;
                float4 _AlphaTex_ST;
                float _AddInt;
            CBUFFER_END

            struct VertexInput
            {
                float4 vertex : POSITION;
                float4 vertexColor : COLOR;
                float2 uv : TEXCOORD0;
                float2 uv1 : TEXCOORD1;

                UNITY_VERTEX_INPUT_INSTANCE_ID
            };

            struct VertexOutput
            {
               float4 vertex : SV_POSITION;
               float4 vertexColor : COLOR;
               float2 uv : TEXCOORD0;
               float2 uv1 : TEXCOORD1;
               float fogCoord : TEXCOORD2;

               UNITY_VERTEX_INPUT_INSTANCE_ID
               UNITY_VERTEX_OUTPUT_STEREO
            };
                                 
            VertexOutput vert(VertexInput v)

            {
                VertexOutput o;
                UNITY_SETUP_INSTANCE_ID(v);
                UNITY_TRANSFER_INSTANCE_ID(v, o);

                o.vertex = TransformWorldToHClip(TransformObjectToWorld(v.vertex.xyz));
                o.uv = v.uv.xy * _MainTex_ST.xy + _MainTex_ST.zw;
                o.uv1 = v.uv.xy * _AlphaTex_ST.xy + _AlphaTex_ST.zw;
                o.vertexColor = v.vertexColor;
                o.fogCoord = ComputeFogFactor(o.vertex.z);
                VertexPositionInputs vertexInput = GetVertexPositionInputs(v.vertex.xyz);

               return o;
            }

            float4 frag(VertexOutput i) : SV_Target
            {          
              UNITY_SETUP_INSTANCE_ID(i);
			  UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i);

              float4 c = tex2D(_MainTex, i.uv) * _TintColor * _AddInt;
                     c.rgb = MixFog(c.rgb, i.fogCoord);

              float4 alpha = tex2D(_AlphaTex, i.uv1);

              return c * i.vertexColor * alpha;
            }

            ENDHLSL
   
        }
    }
    Fallback "Universal Render Pipeline/Particles/Unlit"
}




