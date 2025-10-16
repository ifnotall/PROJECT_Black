Shader "Archipin/FX/Fx_MaskUV_Loop_URP_2Tex"
{
    Properties
    {
        _TintColor("Color", Color) = (1,1,1,1)
        _MainTex("Main Texture", 2D) = "white" {}
        _MainTexXSpeed("Main Tex X Speed", Range(-100,100)) = 0
		_MainTexYSpeed("Main Tex Y Speed", Range(-10,10)) = 0
        [Space(20)]
        _SecondTex("Second Texture", 2D) = "white" {}
        _SecondTexXSpeed("Second Tex X Speed", Range(-100,100)) = 0
		_SecondTexYSpeed("Second Tex Y Speed", Range(-10,10)) = 0
        [Space(20)]
        _NoiseTex("Noise Texure", 2D) = "white" {}
		_NoisePower("Noise Power", float) = 1
		_NoiseXSpeed("Noise X Speed", Range(-100,100)) = 0
		_NoiseYSpeed("Noise Y Speed", Range(-10,10)) = 0
        [Space(20)]
        _AlphaTex("Alpha Texure", 2D) = "white" {}
        [Space(20)]
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
                float _MainTexXSpeed;
	            float _MainTexYSpeed;
                sampler2D _SecondTex;
                float _SecondTexXSpeed;
	            float _SecondTexYSpeed;
                sampler2D _NoiseTex;
                float _NoisePower;
                float _NoiseXSpeed;
                float _NoiseYSpeed;
                sampler2D _AlphaTex;
                float4 _MainTex_ST;
                float4 _NoiseTex_ST;
                float4 _AlphaTex_ST;
                float4 _SecondTex_ST;
                float _AddInt;
            CBUFFER_END

            struct VertexInput
            {
                float4 vertex : POSITION;
                float4 vertexColor : COLOR;
                float2 uv : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float2 uv2 : TEXCOORD2;
                float2 uv3 : TEXCOORD3;

                UNITY_VERTEX_INPUT_INSTANCE_ID
            };

            struct VertexOutput
            {
               float4 vertex : SV_POSITION;
               float4 vertexColor : COLOR;
               float2 uv : TEXCOORD0;
               float2 uv1 : TEXCOORD1;
               float2 uv2 : TEXCOORD2;
               float2 uv3 : TEXCOORD3;
               float fogCoord : TEXCOORD4;

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
                o.uv1 = v.uv.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
                o.uv2 = v.uv.xy * _AlphaTex_ST.xy + _AlphaTex_ST.zw;
                o.uv3 = v.uv.xy * _SecondTex_ST.xy + _SecondTex_ST.zw;
                o.vertexColor = v.vertexColor;
                o.fogCoord = ComputeFogFactor(o.vertex.z);
                VertexPositionInputs vertexInput = GetVertexPositionInputs(v.vertex.xyz);

               return o;
            }

            float4 frag(VertexOutput i) : SV_Target
            {          
              UNITY_SETUP_INSTANCE_ID(i);
			  UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i);
              
              float4 s = tex2D(_SecondTex, float2(i.uv3.x - (_Time.x*15) * _SecondTexXSpeed, i.uv3.y - _Time.y * _SecondTexYSpeed));  
              float2 w = tex2D(_NoiseTex, float2(i.uv1.x - (_Time.x*15) * _NoiseXSpeed, i.uv1.y - _Time.y * _NoiseYSpeed)) * _NoisePower;  
              float4 c = tex2D(_MainTex,float2(i.uv.x - (_Time.x*15) * _MainTexXSpeed, i.uv.y - _Time.y * _MainTexYSpeed) + w) * _TintColor * _AddInt * s;
                     c.rgb = MixFog(c.rgb, i.fogCoord);
              float4 alpha = tex2D(_AlphaTex, i.uv2);
             
              return c * i.vertexColor * alpha.a;
            }

            ENDHLSL
   
        }
    }
    Fallback "Universal Render Pipeline/Particles/Unlit"
}




