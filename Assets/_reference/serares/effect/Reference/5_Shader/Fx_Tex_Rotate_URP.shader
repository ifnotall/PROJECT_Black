
Shader "Archipin/FX/Fx_Tex_Rotate_URP"
{
	Properties
	{
		_MainColor("Main Color", Color) = (1,1,1,1)
		_MainTexture("Main Texture", 2D) = "white" {}
		_MainInt("Main Int", Float) = 1
		//[Toggle(_MainRotate_ON)] _RotateOn("Main Rotate_ON", Float) = 0
		//_Rotate("Main Rotate", Float) = 0
		_MainRotateSpeed("Main Rotate Speed", Float) = 0
		[Space(20)]

		_SecondColor("Second Color", Color) = (1,1,1,0)
		_SecondTexture("Second Texture", 2D) = "white" {}
		_SecondInt("Second Int", Float) = 1
		//[Toggle(_SeRotate_ON)] _SeRotateOn("Se Rotate On", Float) = 0
		//_SeRotate("Se Rotate", Float) = 0
		_SeRotateSpeed("Se Rotate Speed", Float) = 0
		[Space(20)]

		//[Toggle(_NOISEON_ON)] _NoiseOn("Noise On", Float) = 0
		_NoiseTexture("Noise Texture", 2D) = "white" {}
		_NoiseUV("Noise UV", Vector) = (0,0,0,0)
		_NoisePower("Noise Power", Float) = 1
		[Space(20)]

		_Alpha("Alpha", 2D) = "white" {}

		[Enum(UnityEngine.Rendering.BlendMode)] _SrcBlend ("SrcBlend mode", Float) = 1
		[Enum(UnityEngine.Rendering.BlendMode)] _DstBlend ("DstBlend mode", Float) = 1
		[Toggle] _Zwrite("Zwrite", float) = 0
		[Toggle] _Cull ("Cull", float) = 0	
	}

	SubShader
	{
		Tags {  "RenderPipeline"="UniversalPipeline" "RenderType"="Transparent" "Queue"="Transparent+900"}
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
					float4 _SecondColor;
					sampler2D _SecondTexture;
					sampler2D _MainTexture;
					float4 _MainTexture_ST;
					float4 _SecondTexture_ST;
					//float _SeRotate;
					float _SeRotateSpeed;
					float _SecondInt;
					float4 _MainColor;
					//float _Rotate;
					float _MainRotateSpeed;
					sampler2D _NoiseTexture;
					float2 _NoiseUV;
					float4 _NoiseTexture_ST;
					float _NoisePower;
					float _MainInt;
					sampler2D _Alpha;
					float4 _Alpha_ST;
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
					o.uv = v.uv.xy * _MainTexture_ST.xy + _MainTexture_ST.zw;
					o.uv1 = v.uv.xy * _SecondTexture_ST.xy + _SecondTexture_ST.zw;
					o.uv2 = v.uv.xy * _NoiseTexture_ST.xy + _NoiseTexture_ST.zw;
					o.uv3 = v.uv.xy * _Alpha_ST.xy + _Alpha_ST.zw;
					o.vertexColor = v.vertexColor;
					o.fogCoord = ComputeFogFactor(o.vertex.z);
					VertexPositionInputs vertexInput = GetVertexPositionInputs(v.vertex.xyz);

				return o;
				}

			float4 frag(VertexOutput i) : SV_Target
			{          
				UNITY_SETUP_INSTANCE_ID(i);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i);
				
				float SeRotateSpeedFinal = _Time.y * _SeRotateSpeed;
				float SeRotateCos = cos( SeRotateSpeedFinal );
				float SeRotateSin = sin( SeRotateSpeedFinal );
				float2 SeTexFinal = mul( i.uv - float2( 0.5,0.5 ) , float2x2( SeRotateCos , -SeRotateSin , SeRotateSin , SeRotateCos )) + float2( 0.5,0.5 );

				float MainRotateSpeedFinal = _Time.y * _MainRotateSpeed;
				float MainRotateCos = cos( MainRotateSpeedFinal );
				float MainRotateSin = sin( MainRotateSpeedFinal );
				float2 MainTexFinal = mul( i.uv - float2( 0.5,0.5 ) , float2x2( MainRotateCos , -MainRotateSin , MainRotateSin , MainRotateCos )) + float2( 0.5,0.5 );

				
				float2 NoiseUVFinal = ( _Time.y * _NoiseUV + i.uv2);
				float NoiseFinal = ( tex2D( _NoiseTexture, NoiseUVFinal ).r * _NoisePower );
				float4 final = ( ( ( _SecondColor * tex2D( _SecondTexture, SeTexFinal ) ) * _SecondInt ) * ( ( _MainColor * tex2D( _MainTexture, ( MainTexFinal + NoiseFinal ) ) ) * _MainInt ));
					   final.rgb = MixFog(final.rgb, i.fogCoord);
				
				
				float4 alpha = tex2D(_Alpha, i.uv3);

				return final * i.vertexColor * alpha;
			}

			ENDHLSL
		}
	}
	Fallback "Universal Render Pipeline/Particles/Unlit"
}
