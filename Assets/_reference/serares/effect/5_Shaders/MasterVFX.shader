// Made with Amplify Shader Editor v1.9.1.5
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Uber/MasterVFX"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[ASEBegin]_Blend1("Blend1", Range( 0 , 1)) = 1
		[Header(Base Texture)][NoScaleOffset][Space(10)]_Base_Tex("Base_Tex", 2D) = "white" {}
		_BaseTexxyTilingzwOffset("BaseTex xy(Tiling),zw(Offset)", Vector) = (1,1,0,0)
		_BaseTexxydirzSpeedwPolarC1("BaseTex xy(dir), z(Speed),w(PolarC-1)", Vector) = (1,1,0,0)
		[Toggle(_USE_CUSTOM1_XY_BASE_ZWOFFSET_ON)] _use_custom1_xy_base_zwOffset("use_custom1_xy_base_zw(Offset)", Float) = 0
		_BaseColor_Transition("BaseColor_Transition", Float) = 0
		_BaseColor_Smoothness("BaseColor_Smoothness", Float) = 1
		[HDR]_R_Light_Color("R_Light_Color", Color) = (1,1,1,0)
		[HDR]_R_dark_Color("R_dark_Color", Color) = (0,0,0,0)
		[Toggle]_MainTex_R("MainTex_R", Float) = 0
		[Toggle]_MainTex_G("MainTex_G", Float) = 1
		[Toggle]_MainTex_B("MainTex_B", Float) = 0
		[Toggle]_MainTex_A("MainTex_A", Float) = 0
		[Header(Color Texture Settings)][Space(10)][Toggle(_COLORTEXTURESETTINGS_ON)] _ColorTextureSettings("Color Texture Settings", Float) = 0
		[NoScaleOffset]_Color_Tex("Color_Tex", 2D) = "white" {}
		_ColorTex_xyTilingzwOffset("ColorTex_xy(Tiling),zw(Offset)", Vector) = (1,1,0,0)
		[Tooltip(sdfdsf)]_ColorTex_xydirzSpeedwPolarC1("ColorTex_xy(dir), z(Speed),w(PolarC-1)", Vector) = (1,1,0,0)
		_Color_Hue("Color_Hue", Float) = 0
		_AllPower("All Power", Float) = 1
		[HDR]_AllColor("AllColor ", Color) = (1,1,1,0)
		[Header(Mask Texture Setting)][Space(10)][Toggle(_MASKACTIVATE_ON)] _MaskActivate("MaskActivate", Float) = 0
		[NoScaleOffset]_Mask_Tex("Mask_Tex", 2D) = "white" {}
		_MaskTex_xyTilingzwOffset("MaskTex_xy(Tiling),zw(Offset)", Vector) = (1,1,0,0)
		_MaskTex_xydirzSpeedwPolarC1("MaskTex_xy(dir), z(Speed),w(PolarC-1)", Vector) = (1,1,0,0)
		_MaskTex_Transition("MaskTex_Transition", Float) = 0
		_MaskTex_Smoothness("MaskTex_Smoothness", Float) = 1
		[Toggle(_USE_CUSTOM1_ZW_MASK_ZWOFFSET_ON)] _Use_Custom1_zw_Mask_zwOffset("Use_Custom1_zw_Mask_zw(Offset)", Float) = 0
		[Header(Dissolve Texture Settings)][Space(10)][Toggle(_DISSOLVETEXTURESETTINGS_ON)] _DissolveTextureSettings("Dissolve Texture Settings", Float) = 0
		[NoScaleOffset]_Dissolve_Tex("Dissolve_Tex", 2D) = "white" {}
		_DissolveTex_xyTilingzwOffset("DissolveTex_xy(Tiling),zw(Offset)", Vector) = (1,1,0,0)
		_DissolveTex_xydirzSpeedwPolarC1("DissolveTex_xy(dir), z(Speed),w(PolarC-1)", Vector) = (1,1,0,0)
		_DissolveTex_Transition("DissolveTex_Transition", Float) = 0
		_DissolveTex_Smoothness("DissolveTex_Smoothness", Float) = 1
		[Toggle(_USE_CUSTOM2_X_DISSOLVETRANSITION_ON)] _Use_Custom2_x_DissolveTransition("Use_Custom2_x_DissolveTransition", Float) = 0
		[HDR]_EdgeHighlightColor1("EdgeHighlight Color 1", Color) = (1,1,1,0)
		_EdgeHighlight("EdgeHighlight", Range( 0 , 1)) = 0
		_Distort_DissolveTexAdvanceSetting("Distort_DissolveTex(AdvanceSetting)", 2D) = "white" {}
		_DistortDissolvePower("DistortDissolvePower", Float) = 0
		[Header(Distort Texture Setting)][Space(10)][Toggle(_DISTORTTEXTURESETTING_ON)] _DistortTextureSetting("Distort Texture Setting", Float) = 0
		[NoScaleOffset]_Distort_Tex("Distort_Tex", 2D) = "white" {}
		_Distort_xyTilingzwOffset("Distort_xy(Tiling),zw(Offset)", Vector) = (1,1,0,0)
		_DistortTex_xydirzSpeedwPolarC1("DistortTex_xy(dir), z(Speed),w(PolarC-1)", Vector) = (1,1,0,0)
		_Distort_Directionxy("Distort_Direction(xy)", Vector) = (0.3,0.3,0,0)
		_DistortPower("Distort Power", Range( -2 , 2)) = 0.2
		[Toggle(_USE_CUSTOM2_Y_DISTORTPOWER_ON)] _use_custom2_y_distortPower("use_custom2_y_distortPower", Float) = 0
		[Header(Other Settings)][Enum(UnityEngine.Rendering.BlendMode)][Space(10)]_Src("Src", Float) = 5
		[Enum(UnityEngine.Rendering.BlendMode)]_Dst("Dst", Float) = 10
		[Enum(UnityEngine.Rendering.CompareFunction)]_ZTestMode("ZTest Mode", Float) = 4
		[Space(5)][Header(ParticleSetting)][Toggle(_SOFTPARTICLEACTIVATE_ON)] _SoftParticleActivate("SoftParticle Activate", Float) = 0
		[ASEEnd][Space(5)]_SoftParticlesDistance("SoftParticles Distance", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}


		//_TessPhongStrength( "Tess Phong Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Tess Max Tessellation", Range( 1, 32 ) ) = 16
		//_TessMin( "Tess Min Distance", Float ) = 10
		//_TessMax( "Tess Max Distance", Float ) = 25
		//_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		//_TessMaxDisp( "Tess Max Displacement", Float ) = 25

		[HideInInspector] _QueueOffset("_QueueOffset", Float) = 0
        [HideInInspector] _QueueControl("_QueueControl", Float) = -1

        [HideInInspector][NoScaleOffset] unity_Lightmaps("unity_Lightmaps", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_LightmapsInd("unity_LightmapsInd", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_ShadowMasks("unity_ShadowMasks", 2DArray) = "" {}
	}

	SubShader
	{
		LOD 0

		

		Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Transparent" "Queue"="Transparent" "UniversalMaterialType"="Unlit" }

		Cull Off
		AlphaToMask Off

		

		HLSLINCLUDE
		#pragma target 4.5
		#pragma prefer_hlslcc gles
		// ensure rendering platforms toggle list is visible

		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Filtering.hlsl"

		#ifndef ASE_TESS_FUNCS
		#define ASE_TESS_FUNCS
		float4 FixedTess( float tessValue )
		{
			return tessValue;
		}

		float CalcDistanceTessFactor (float4 vertex, float minDist, float maxDist, float tess, float4x4 o2w, float3 cameraPos )
		{
			float3 wpos = mul(o2w,vertex).xyz;
			float dist = distance (wpos, cameraPos);
			float f = clamp(1.0 - (dist - minDist) / (maxDist - minDist), 0.01, 1.0) * tess;
			return f;
		}

		float4 CalcTriEdgeTessFactors (float3 triVertexFactors)
		{
			float4 tess;
			tess.x = 0.5 * (triVertexFactors.y + triVertexFactors.z);
			tess.y = 0.5 * (triVertexFactors.x + triVertexFactors.z);
			tess.z = 0.5 * (triVertexFactors.x + triVertexFactors.y);
			tess.w = (triVertexFactors.x + triVertexFactors.y + triVertexFactors.z) / 3.0f;
			return tess;
		}

		float CalcEdgeTessFactor (float3 wpos0, float3 wpos1, float edgeLen, float3 cameraPos, float4 scParams )
		{
			float dist = distance (0.5 * (wpos0+wpos1), cameraPos);
			float len = distance(wpos0, wpos1);
			float f = max(len * scParams.y / (edgeLen * dist), 1.0);
			return f;
		}

		float DistanceFromPlane (float3 pos, float4 plane)
		{
			float d = dot (float4(pos,1.0f), plane);
			return d;
		}

		bool WorldViewFrustumCull (float3 wpos0, float3 wpos1, float3 wpos2, float cullEps, float4 planes[6] )
		{
			float4 planeTest;
			planeTest.x = (( DistanceFromPlane(wpos0, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[0]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.y = (( DistanceFromPlane(wpos0, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[1]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.z = (( DistanceFromPlane(wpos0, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[2]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.w = (( DistanceFromPlane(wpos0, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[3]) > -cullEps) ? 1.0f : 0.0f );
			return !all (planeTest);
		}

		float4 DistanceBasedTess( float4 v0, float4 v1, float4 v2, float tess, float minDist, float maxDist, float4x4 o2w, float3 cameraPos )
		{
			float3 f;
			f.x = CalcDistanceTessFactor (v0,minDist,maxDist,tess,o2w,cameraPos);
			f.y = CalcDistanceTessFactor (v1,minDist,maxDist,tess,o2w,cameraPos);
			f.z = CalcDistanceTessFactor (v2,minDist,maxDist,tess,o2w,cameraPos);

			return CalcTriEdgeTessFactors (f);
		}

		float4 EdgeLengthBasedTess( float4 v0, float4 v1, float4 v2, float edgeLength, float4x4 o2w, float3 cameraPos, float4 scParams )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;
			tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
			tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
			tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
			tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			return tess;
		}

		float4 EdgeLengthBasedTessCull( float4 v0, float4 v1, float4 v2, float edgeLength, float maxDisplacement, float4x4 o2w, float3 cameraPos, float4 scParams, float4 planes[6] )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;

			if (WorldViewFrustumCull(pos0, pos1, pos2, maxDisplacement, planes))
			{
				tess = 0.0f;
			}
			else
			{
				tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
				tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
				tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
				tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			}
			return tess;
		}
		#endif //ASE_TESS_FUNCS
		ENDHLSL

		
		Pass
		{
			
			Name "Forward"
			Tags { "LightMode"="UniversalForward" }

			Blend [_Src] [_Dst], SrcAlpha OneMinusSrcAlpha
			ZWrite Off
			ZTest [_ZTestMode]
			Offset 0 , 0
			ColorMask RGBA

			

			HLSLPROGRAM

			#define _SURFACE_TYPE_TRANSPARENT 1
			#define ASE_SRP_VERSION 140011
			#define REQUIRE_DEPTH_TEXTURE 1


			#pragma instancing_options renderinglayer

			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma shader_feature _ _SAMPLE_GI
			#pragma multi_compile_fragment _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3
        	#pragma multi_compile_fragment _ DEBUG_DISPLAY
        	#pragma multi_compile_fragment _ _SCREEN_SPACE_OCCLUSION
        	#pragma multi_compile_fragment _ _WRITE_RENDERING_LAYERS

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_UNLIT

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DBuffer.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Debug/Debugging3D.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/SurfaceData.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"

			#define ASE_NEEDS_FRAG_COLOR
			#pragma shader_feature_local _MASKACTIVATE_ON
			#pragma shader_feature_local _USE_CUSTOM1_ZW_MASK_ZWOFFSET_ON
			#pragma shader_feature_local _USE_CUSTOM2_X_DISSOLVETRANSITION_ON
			#pragma shader_feature_local _DISTORTTEXTURESETTING_ON
			#pragma shader_feature_local _USE_CUSTOM2_Y_DISTORTPOWER_ON
			#pragma shader_feature_local _DISSOLVETEXTURESETTINGS_ON
			#pragma shader_feature_local _USE_CUSTOM1_XY_BASE_ZWOFFSET_ON
			#pragma shader_feature_local _COLORTEXTURESETTINGS_ON
			#pragma shader_feature_local _SOFTPARTICLEACTIVATE_ON


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD1;
				#endif
				#ifdef ASE_FOG
					float fogFactor : TEXCOORD2;
				#endif
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_color : COLOR;
				float4 ase_texcoord6 : TEXCOORD6;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _DistortTex_xydirzSpeedwPolarC1;
			float4 _R_Light_Color;
			float4 _R_dark_Color;
			float4 _EdgeHighlightColor1;
			float4 _Distort_DissolveTexAdvanceSetting_ST;
			float4 _Distort_Directionxy;
			float4 _Distort_xyTilingzwOffset;
			float4 _BaseTexxyTilingzwOffset;
			float4 _DissolveTex_xyTilingzwOffset;
			float4 _BaseTexxydirzSpeedwPolarC1;
			float4 _ColorTex_xydirzSpeedwPolarC1;
			float4 _MaskTex_xyTilingzwOffset;
			float4 _MaskTex_xydirzSpeedwPolarC1;
			float4 _ColorTex_xyTilingzwOffset;
			float4 _AllColor;
			float4 _DissolveTex_xydirzSpeedwPolarC1;
			float _MainTex_A;
			float _MainTex_B;
			float _MainTex_G;
			float _MainTex_R;
			float _AllPower;
			float _Color_Hue;
			float _Src;
			float _EdgeHighlight;
			float _BaseColor_Transition;
			float _Blend1;
			float _DistortDissolvePower;
			float _DistortPower;
			float _DissolveTex_Smoothness;
			float _DissolveTex_Transition;
			float _MaskTex_Smoothness;
			float _MaskTex_Transition;
			float _ZTestMode;
			float _Dst;
			float _BaseColor_Smoothness;
			float _SoftParticlesDistance;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _Mask_Tex;
			sampler2D _Dissolve_Tex;
			sampler2D _Distort_Tex;
			sampler2D _Distort_DissolveTexAdvanceSetting;
			sampler2D _Base_Tex;
			sampler2D _Color_Tex;
			uniform float4 _CameraDepthTexture_TexelSize;


			float3 HSVToRGB( float3 c )
			{
				float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
				float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
				return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
			}
			

			VertexOutput VertexFunction ( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float4 ase_clipPos = TransformObjectToHClip((v.vertex).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord6 = screenPos;
				
				o.ase_texcoord3.xy = v.ase_texcoord.xy;
				o.ase_texcoord4 = v.ase_texcoord1;
				o.ase_texcoord5 = v.ase_texcoord2;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float4 positionCS = TransformWorldToHClip( positionWS );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.worldPos = positionWS;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				#ifdef ASE_FOG
					o.fogFactor = ComputeFogFactor( positionCS.z );
				#endif

				o.clipPos = positionCS;

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord1 = v.ase_texcoord1;
				o.ase_texcoord2 = v.ase_texcoord2;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				o.ase_texcoord2 = patch[0].ase_texcoord2 * bary.x + patch[1].ase_texcoord2 * bary.y + patch[2].ase_texcoord2 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag ( VertexOutput IN
				#ifdef _WRITE_RENDERING_LAYERS
				, out float4 outRenderingLayers : SV_Target1
				#endif
				 ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = IN.worldPos;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float mulTime152 = _TimeParameters.x * _MaskTex_xydirzSpeedwPolarC1.z;
				float2 appendResult154 = (float2(_MaskTex_xydirzSpeedwPolarC1.x , _MaskTex_xydirzSpeedwPolarC1.y));
				float2 appendResult78 = (float2(_MaskTex_xyTilingzwOffset.x , _MaskTex_xyTilingzwOffset.y));
				float2 CenteredUV15_g21 = ( IN.ase_texcoord3.xy - float2( 0.5,0.5 ) );
				float2 break17_g21 = CenteredUV15_g21;
				float2 appendResult79 = (float2(_MaskTex_xyTilingzwOffset.z , _MaskTex_xyTilingzwOffset.w));
				float4 texCoord72 = IN.ase_texcoord4;
				texCoord72.xy = IN.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult74 = (float2(texCoord72.z , texCoord72.w));
				#ifdef _USE_CUSTOM1_ZW_MASK_ZWOFFSET_ON
				float2 staticSwitch71 = appendResult74;
				#else
				float2 staticSwitch71 = appendResult79;
				#endif
				float2 break244 = staticSwitch71;
				float ifLocalVar420 = 0;
				ifLocalVar420 = 1.0;
				float2 appendResult23_g21 = (float2(( length( CenteredUV15_g21 ) * 1.0 * 2.0 ) , ( atan2( break17_g21.x , break17_g21.y ) * ( 1.0 / TWO_PI ) * ifLocalVar420 )));
				float2 appendResult419 = (float2(break244.x , break244.y));
				float2 panner156 = ( mulTime152 * appendResult154 + ( appendResult78 * ( 1.0 - ( appendResult23_g21 + appendResult419 ) ) ));
				float2 texCoord64 = IN.ase_texcoord3.xy * appendResult78 + staticSwitch71;
				float2 panner158 = ( mulTime152 * appendResult154 + texCoord64);
				float2 ifLocalVar157 = 0;
				if( _MaskTex_xydirzSpeedwPolarC1.w >= 1.0 )
				ifLocalVar157 = panner156;
				else
				ifLocalVar157 = panner158;
				float smoothstepResult66 = smoothstep( _MaskTex_Transition , ( _MaskTex_Transition + _MaskTex_Smoothness ) , tex2D( _Mask_Tex, ifLocalVar157 ).r);
				#ifdef _MASKACTIVATE_ON
				float staticSwitch265 = smoothstepResult66;
				#else
				float staticSwitch265 = 1.0;
				#endif
				float Mask212 = staticSwitch265;
				float4 texCoord86 = IN.ase_texcoord5;
				texCoord86.xy = IN.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _USE_CUSTOM2_X_DISSOLVETRANSITION_ON
				float staticSwitch83 = texCoord86.x;
				#else
				float staticSwitch83 = _DissolveTex_Transition;
				#endif
				float temp_output_89_0 = ( _DissolveTex_Smoothness + staticSwitch83 );
				float mulTime159 = _TimeParameters.x * _DissolveTex_xydirzSpeedwPolarC1.z;
				float2 appendResult161 = (float2(_DissolveTex_xydirzSpeedwPolarC1.x , _DissolveTex_xydirzSpeedwPolarC1.y));
				float2 appendResult84 = (float2(_DissolveTex_xyTilingzwOffset.x , _DissolveTex_xyTilingzwOffset.y));
				float2 CenteredUV15_g19 = ( IN.ase_texcoord3.xy - float2( 0.5,0.5 ) );
				float2 break17_g19 = CenteredUV15_g19;
				float2 appendResult81 = (float2(_DissolveTex_xyTilingzwOffset.z , _DissolveTex_xyTilingzwOffset.w));
				float2 break208 = appendResult81;
				float ifLocalVar428 = 0;
				ifLocalVar428 = 1.0;
				float2 appendResult23_g19 = (float2(( length( CenteredUV15_g19 ) * 1.0 * 2.0 ) , ( atan2( break17_g19.x , break17_g19.y ) * ( 1.0 / TWO_PI ) * ifLocalVar428 )));
				float2 appendResult429 = (float2(break208.x , break208.y));
				float2 panner163 = ( mulTime159 * appendResult161 + ( appendResult84 * ( 1.0 - ( appendResult23_g19 + appendResult429 ) ) ));
				float2 texCoord85 = IN.ase_texcoord3.xy * appendResult84 + appendResult81;
				float2 panner165 = ( mulTime159 * appendResult161 + texCoord85);
				float2 ifLocalVar164 = 0;
				if( _DissolveTex_xydirzSpeedwPolarC1.w >= 1.0 )
				ifLocalVar164 = panner163;
				else
				ifLocalVar164 = panner165;
				float4 temp_cast_1 = (0.0).xxxx;
				float mulTime186 = _TimeParameters.x * _DistortTex_xydirzSpeedwPolarC1.z;
				float2 appendResult187 = (float2(_DistortTex_xydirzSpeedwPolarC1.x , _DistortTex_xydirzSpeedwPolarC1.y));
				float2 appendResult117 = (float2(_Distort_xyTilingzwOffset.x , _Distort_xyTilingzwOffset.y));
				float2 CenteredUV15_g18 = ( IN.ase_texcoord3.xy - float2( 0.5,0.5 ) );
				float2 break17_g18 = CenteredUV15_g18;
				float2 appendResult118 = (float2(_Distort_xyTilingzwOffset.z , _Distort_xyTilingzwOffset.w));
				float2 break434 = appendResult118;
				float ifLocalVar432 = 0;
				ifLocalVar432 = 1.0;
				float2 appendResult23_g18 = (float2(( length( CenteredUV15_g18 ) * 1.0 * 2.0 ) , ( atan2( break17_g18.x , break17_g18.y ) * ( 1.0 / TWO_PI ) * ifLocalVar432 )));
				float2 appendResult433 = (float2(break434.x , break434.y));
				float2 panner188 = ( mulTime186 * appendResult187 + ( appendResult117 * ( 1.0 - ( appendResult23_g18 + appendResult433 ) ) ));
				float2 texCoord119 = IN.ase_texcoord3.xy * appendResult117 + appendResult118;
				float2 panner192 = ( mulTime186 * appendResult187 + texCoord119);
				float2 ifLocalVar191 = 0;
				if( _DistortTex_xydirzSpeedwPolarC1.w >= 1.0 )
				ifLocalVar191 = panner188;
				else
				ifLocalVar191 = panner192;
				float2 appendResult126 = (float2(_Distort_Directionxy.x , _Distort_Directionxy.y));
				float4 texCoord136 = IN.ase_texcoord5;
				texCoord136.xy = IN.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _USE_CUSTOM2_Y_DISTORTPOWER_ON
				float staticSwitch137 = texCoord136.y;
				#else
				float staticSwitch137 = _DistortPower;
				#endif
				#ifdef _DISTORTTEXTURESETTING_ON
				float4 staticSwitch267 = ( tex2D( _Distort_Tex, ifLocalVar191 ) * float4( appendResult126, 0.0 , 0.0 ) * staticSwitch137 );
				#else
				float4 staticSwitch267 = temp_cast_1;
				#endif
				float4 Distort122 = staticSwitch267;
				float2 uv_Distort_DissolveTexAdvanceSetting = IN.ase_texcoord3.xy * _Distort_DissolveTexAdvanceSetting_ST.xy + _Distort_DissolveTexAdvanceSetting_ST.zw;
				float4 tex2DNode76 = tex2D( _Dissolve_Tex, ( float4( ifLocalVar164, 0.0 , 0.0 ) + Distort122 + ( tex2D( _Distort_DissolveTexAdvanceSetting, uv_Distort_DissolveTexAdvanceSetting ) * _DistortDissolvePower ) ).rg );
				float smoothstepResult87 = smoothstep( staticSwitch83 , temp_output_89_0 , tex2DNode76.r);
				float temp_output_109_0 = (0.0 + (_EdgeHighlight - 0.0) * (0.12 - 0.0) / (0.25 - 0.0));
				float smoothstepResult93 = smoothstep( ( staticSwitch83 + temp_output_109_0 ) , ( temp_output_89_0 + temp_output_109_0 ) , tex2DNode76.r);
				float temp_output_339_0 = saturate( ( smoothstepResult87 - smoothstepResult93 ) );
				#ifdef _DISSOLVETEXTURESETTINGS_ON
				float staticSwitch461 = 1.0;
				#else
				float staticSwitch461 = 0.0;
				#endif
				float4 Highlights278 = ( ( temp_output_339_0 * _EdgeHighlightColor1 ) * staticSwitch461 );
				float4 temp_cast_4 = (_BaseColor_Transition).xxxx;
				float4 temp_cast_5 = (( _BaseColor_Transition + _BaseColor_Smoothness )).xxxx;
				float mulTime145 = _TimeParameters.x * _BaseTexxydirzSpeedwPolarC1.z;
				float2 appendResult143 = (float2(_BaseTexxydirzSpeedwPolarC1.x , _BaseTexxydirzSpeedwPolarC1.y));
				float2 appendResult12 = (float2(_BaseTexxyTilingzwOffset.x , _BaseTexxyTilingzwOffset.y));
				float2 CenteredUV15_g20 = ( IN.ase_texcoord3.xy - float2( 0.5,0.5 ) );
				float2 break17_g20 = CenteredUV15_g20;
				float2 appendResult13 = (float2(_BaseTexxyTilingzwOffset.z , _BaseTexxyTilingzwOffset.w));
				float4 texCoord176 = IN.ase_texcoord4;
				texCoord176.xy = IN.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult177 = (float2(texCoord176.x , texCoord176.y));
				#ifdef _USE_CUSTOM1_XY_BASE_ZWOFFSET_ON
				float2 staticSwitch175 = appendResult177;
				#else
				float2 staticSwitch175 = appendResult13;
				#endif
				float2 break184 = staticSwitch175;
				float ifLocalVar412 = 0;
				ifLocalVar412 = 1.0;
				float2 appendResult23_g20 = (float2(( length( CenteredUV15_g20 ) * 1.0 * 2.0 ) , ( atan2( break17_g20.x , break17_g20.y ) * ( 1.0 / TWO_PI ) * ifLocalVar412 )));
				float2 temp_output_141_0 = appendResult23_g20;
				float2 appendResult418 = (float2(break184.x , break184.y));
				float2 panner151 = ( mulTime145 * appendResult143 + ( appendResult12 * ( 1.0 - ( temp_output_141_0 + appendResult418 ) ) ));
				float2 texCoord5 = IN.ase_texcoord3.xy * appendResult12 + staticSwitch175;
				float2 panner139 = ( mulTime145 * appendResult143 + texCoord5);
				float2 ifLocalVar144 = 0;
				if( _BaseTexxydirzSpeedwPolarC1.w >= 1.0 )
				ifLocalVar144 = panner151;
				else
				ifLocalVar144 = panner139;
				float4 tex2DNode6 = tex2D( _Base_Tex, ( float4( ifLocalVar144, 0.0 , 0.0 ) + Distort122 ).rg );
				float lerpResult42 = lerp( 0.0 , tex2DNode6.r , (( _MainTex_R )?( 1.0 ):( 0.0 )));
				float lerpResult43 = lerp( lerpResult42 , tex2DNode6.g , (( _MainTex_G )?( 1.0 ):( 0.0 )));
				float lerpResult44 = lerp( lerpResult43 , tex2DNode6.b , (( _MainTex_B )?( 1.0 ):( 0.0 )));
				float4 temp_cast_8 = (lerpResult44).xxxx;
				float4 lerpResult45 = lerp( temp_cast_8 , tex2DNode6 , (( _MainTex_A )?( 1.0 ):( 0.0 )));
				float4 smoothstepResult39 = smoothstep( temp_cast_4 , temp_cast_5 , lerpResult45);
				float4 lerpResult47 = lerp( _R_dark_Color , _R_Light_Color , smoothstepResult39);
				float4 temp_cast_9 = (1.0).xxxx;
				float mulTime436 = _TimeParameters.x * _ColorTex_xydirzSpeedwPolarC1.z;
				float2 appendResult226 = (float2(_ColorTex_xydirzSpeedwPolarC1.x , _ColorTex_xydirzSpeedwPolarC1.y));
				float2 appendResult223 = (float2(_ColorTex_xyTilingzwOffset.x , _ColorTex_xyTilingzwOffset.y));
				float2 CenteredUV15_g22 = ( IN.ase_texcoord3.xy - float2( 0.5,0.5 ) );
				float2 break17_g22 = CenteredUV15_g22;
				float2 appendResult224 = (float2(_ColorTex_xyTilingzwOffset.z , _ColorTex_xyTilingzwOffset.w));
				float2 break225 = appendResult224;
				float ifLocalVar424 = 0;
				ifLocalVar424 = 1.0;
				float2 appendResult23_g22 = (float2(( length( CenteredUV15_g22 ) * 1.0 * 2.0 ) , ( atan2( break17_g22.x , break17_g22.y ) * ( 1.0 / TWO_PI ) * ifLocalVar424 )));
				float2 appendResult425 = (float2(break225.x , break225.y));
				float2 panner216 = ( mulTime436 * appendResult226 + ( appendResult223 * ( 1.0 - ( appendResult23_g22 + appendResult425 ) ) ));
				float2 texCoord222 = IN.ase_texcoord3.xy * appendResult223 + float2( 0,0 );
				float2 panner221 = ( mulTime436 * appendResult226 + texCoord222);
				float2 ifLocalVar215 = 0;
				if( _ColorTex_xydirzSpeedwPolarC1.w >= 1.0 )
				ifLocalVar215 = panner216;
				else
				ifLocalVar215 = panner221;
				float3 hsvTorgb257 = HSVToRGB( float3(_Color_Hue,saturate( _Color_Hue ),1.0) );
				#ifdef _COLORTEXTURESETTINGS_ON
				float4 staticSwitch269 = ( ( tex2D( _Color_Tex, ( float4( ifLocalVar215, 0.0 , 0.0 ) + Distort122 ).rg ) * _AllColor * _AllPower ) * float4( hsvTorgb257 , 0.0 ) );
				#else
				float4 staticSwitch269 = temp_cast_9;
				#endif
				#ifdef _DISSOLVETEXTURESETTINGS_ON
				float staticSwitch409 = smoothstepResult93;
				#else
				float staticSwitch409 = 1.0;
				#endif
				float Dissolve205 = saturate( staticSwitch409 );
				float4 ColorTex261 = ( staticSwitch269 * Dissolve205 );
				float4 Base_Tex276 = ( Highlights278 + ( ( lerpResult47 * IN.ase_color ) * ColorTex261 ) );
				
				float4 temp_cast_14 = (1.0).xxxx;
				float4 lerpResult8 = lerp( lerpResult45 , temp_cast_14 , _Blend1);
				#ifdef _DISSOLVETEXTURESETTINGS_ON
				float staticSwitch271 = smoothstepResult87;
				#else
				float staticSwitch271 = 1.0;
				#endif
				float DissolveAlpha331 = saturate( staticSwitch271 );
				float4 BaseTex_Mask281 = ( lerpResult8 * Mask212 * IN.ase_color.a * DissolveAlpha331 );
				float4 screenPos = IN.ase_texcoord6;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float screenDepth470 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth470 = saturate( ( screenDepth470 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _SoftParticlesDistance ) );
				#ifdef _SOFTPARTICLEACTIVATE_ON
				float staticSwitch480 = distanceDepth470;
				#else
				float staticSwitch480 = 1.0;
				#endif
				
				float3 BakedAlbedo = 0;
				float3 BakedEmission = 0;
				float3 Color = ( Mask212 * Base_Tex276 ).rgb;
				float Alpha = ( BaseTex_Mask281 * staticSwitch480 ).r;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;

				#ifdef _ALPHATEST_ON
					clip( Alpha - AlphaClipThreshold );
				#endif

				#if defined(_DBUFFER)
					ApplyDecalToBaseColor(IN.clipPos, Color);
				#endif

				#if defined(_ALPHAPREMULTIPLY_ON)
				Color *= Alpha;
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( IN.clipPos );
				#endif

				#ifdef ASE_FOG
					Color = MixFog( Color, IN.fogFactor );
				#endif

				#ifdef _WRITE_RENDERING_LAYERS
					uint renderingLayers = GetMeshRenderingLayer();
					outRenderingLayers = float4( EncodeMeshRenderingLayer( renderingLayers ), 0, 0, 0 );
				#endif

				return half4( Color, Alpha );
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthOnly"
			Tags { "LightMode"="DepthOnly" }

			ZWrite On
			ColorMask 0
			AlphaToMask Off

			HLSLPROGRAM

			#define _SURFACE_TYPE_TRANSPARENT 1
			#define ASE_SRP_VERSION 140011
			#define REQUIRE_DEPTH_TEXTURE 1


			#pragma vertex vert
			#pragma fragment frag

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"

			#pragma shader_feature_local _USE_CUSTOM1_XY_BASE_ZWOFFSET_ON
			#pragma shader_feature_local _DISTORTTEXTURESETTING_ON
			#pragma shader_feature_local _USE_CUSTOM2_Y_DISTORTPOWER_ON
			#pragma shader_feature_local _MASKACTIVATE_ON
			#pragma shader_feature_local _USE_CUSTOM1_ZW_MASK_ZWOFFSET_ON
			#pragma shader_feature_local _DISSOLVETEXTURESETTINGS_ON
			#pragma shader_feature_local _USE_CUSTOM2_X_DISSOLVETRANSITION_ON
			#pragma shader_feature_local _SOFTPARTICLEACTIVATE_ON


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_color : COLOR;
				float4 ase_texcoord5 : TEXCOORD5;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _DistortTex_xydirzSpeedwPolarC1;
			float4 _R_Light_Color;
			float4 _R_dark_Color;
			float4 _EdgeHighlightColor1;
			float4 _Distort_DissolveTexAdvanceSetting_ST;
			float4 _Distort_Directionxy;
			float4 _Distort_xyTilingzwOffset;
			float4 _BaseTexxyTilingzwOffset;
			float4 _DissolveTex_xyTilingzwOffset;
			float4 _BaseTexxydirzSpeedwPolarC1;
			float4 _ColorTex_xydirzSpeedwPolarC1;
			float4 _MaskTex_xyTilingzwOffset;
			float4 _MaskTex_xydirzSpeedwPolarC1;
			float4 _ColorTex_xyTilingzwOffset;
			float4 _AllColor;
			float4 _DissolveTex_xydirzSpeedwPolarC1;
			float _MainTex_A;
			float _MainTex_B;
			float _MainTex_G;
			float _MainTex_R;
			float _AllPower;
			float _Color_Hue;
			float _Src;
			float _EdgeHighlight;
			float _BaseColor_Transition;
			float _Blend1;
			float _DistortDissolvePower;
			float _DistortPower;
			float _DissolveTex_Smoothness;
			float _DissolveTex_Transition;
			float _MaskTex_Smoothness;
			float _MaskTex_Transition;
			float _ZTestMode;
			float _Dst;
			float _BaseColor_Smoothness;
			float _SoftParticlesDistance;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _Base_Tex;
			sampler2D _Distort_Tex;
			sampler2D _Mask_Tex;
			sampler2D _Dissolve_Tex;
			sampler2D _Distort_DissolveTexAdvanceSetting;
			uniform float4 _CameraDepthTexture_TexelSize;


			
			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float4 ase_clipPos = TransformObjectToHClip((v.vertex).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord5 = screenPos;
				
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				o.ase_texcoord3 = v.ase_texcoord1;
				o.ase_texcoord4 = v.ase_texcoord2;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.worldPos = positionWS;
				#endif

				o.clipPos = TransformWorldToHClip( positionWS );
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = o.clipPos;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord1 = v.ase_texcoord1;
				o.ase_texcoord2 = v.ase_texcoord2;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				o.ase_texcoord2 = patch[0].ase_texcoord2 * bary.x + patch[1].ase_texcoord2 * bary.y + patch[2].ase_texcoord2 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = IN.worldPos;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float mulTime145 = _TimeParameters.x * _BaseTexxydirzSpeedwPolarC1.z;
				float2 appendResult143 = (float2(_BaseTexxydirzSpeedwPolarC1.x , _BaseTexxydirzSpeedwPolarC1.y));
				float2 appendResult12 = (float2(_BaseTexxyTilingzwOffset.x , _BaseTexxyTilingzwOffset.y));
				float2 CenteredUV15_g20 = ( IN.ase_texcoord2.xy - float2( 0.5,0.5 ) );
				float2 break17_g20 = CenteredUV15_g20;
				float2 appendResult13 = (float2(_BaseTexxyTilingzwOffset.z , _BaseTexxyTilingzwOffset.w));
				float4 texCoord176 = IN.ase_texcoord3;
				texCoord176.xy = IN.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult177 = (float2(texCoord176.x , texCoord176.y));
				#ifdef _USE_CUSTOM1_XY_BASE_ZWOFFSET_ON
				float2 staticSwitch175 = appendResult177;
				#else
				float2 staticSwitch175 = appendResult13;
				#endif
				float2 break184 = staticSwitch175;
				float ifLocalVar412 = 0;
				ifLocalVar412 = 1.0;
				float2 appendResult23_g20 = (float2(( length( CenteredUV15_g20 ) * 1.0 * 2.0 ) , ( atan2( break17_g20.x , break17_g20.y ) * ( 1.0 / TWO_PI ) * ifLocalVar412 )));
				float2 temp_output_141_0 = appendResult23_g20;
				float2 appendResult418 = (float2(break184.x , break184.y));
				float2 panner151 = ( mulTime145 * appendResult143 + ( appendResult12 * ( 1.0 - ( temp_output_141_0 + appendResult418 ) ) ));
				float2 texCoord5 = IN.ase_texcoord2.xy * appendResult12 + staticSwitch175;
				float2 panner139 = ( mulTime145 * appendResult143 + texCoord5);
				float2 ifLocalVar144 = 0;
				if( _BaseTexxydirzSpeedwPolarC1.w >= 1.0 )
				ifLocalVar144 = panner151;
				else
				ifLocalVar144 = panner139;
				float4 temp_cast_1 = (0.0).xxxx;
				float mulTime186 = _TimeParameters.x * _DistortTex_xydirzSpeedwPolarC1.z;
				float2 appendResult187 = (float2(_DistortTex_xydirzSpeedwPolarC1.x , _DistortTex_xydirzSpeedwPolarC1.y));
				float2 appendResult117 = (float2(_Distort_xyTilingzwOffset.x , _Distort_xyTilingzwOffset.y));
				float2 CenteredUV15_g18 = ( IN.ase_texcoord2.xy - float2( 0.5,0.5 ) );
				float2 break17_g18 = CenteredUV15_g18;
				float2 appendResult118 = (float2(_Distort_xyTilingzwOffset.z , _Distort_xyTilingzwOffset.w));
				float2 break434 = appendResult118;
				float ifLocalVar432 = 0;
				ifLocalVar432 = 1.0;
				float2 appendResult23_g18 = (float2(( length( CenteredUV15_g18 ) * 1.0 * 2.0 ) , ( atan2( break17_g18.x , break17_g18.y ) * ( 1.0 / TWO_PI ) * ifLocalVar432 )));
				float2 appendResult433 = (float2(break434.x , break434.y));
				float2 panner188 = ( mulTime186 * appendResult187 + ( appendResult117 * ( 1.0 - ( appendResult23_g18 + appendResult433 ) ) ));
				float2 texCoord119 = IN.ase_texcoord2.xy * appendResult117 + appendResult118;
				float2 panner192 = ( mulTime186 * appendResult187 + texCoord119);
				float2 ifLocalVar191 = 0;
				if( _DistortTex_xydirzSpeedwPolarC1.w >= 1.0 )
				ifLocalVar191 = panner188;
				else
				ifLocalVar191 = panner192;
				float2 appendResult126 = (float2(_Distort_Directionxy.x , _Distort_Directionxy.y));
				float4 texCoord136 = IN.ase_texcoord4;
				texCoord136.xy = IN.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _USE_CUSTOM2_Y_DISTORTPOWER_ON
				float staticSwitch137 = texCoord136.y;
				#else
				float staticSwitch137 = _DistortPower;
				#endif
				#ifdef _DISTORTTEXTURESETTING_ON
				float4 staticSwitch267 = ( tex2D( _Distort_Tex, ifLocalVar191 ) * float4( appendResult126, 0.0 , 0.0 ) * staticSwitch137 );
				#else
				float4 staticSwitch267 = temp_cast_1;
				#endif
				float4 Distort122 = staticSwitch267;
				float4 tex2DNode6 = tex2D( _Base_Tex, ( float4( ifLocalVar144, 0.0 , 0.0 ) + Distort122 ).rg );
				float lerpResult42 = lerp( 0.0 , tex2DNode6.r , (( _MainTex_R )?( 1.0 ):( 0.0 )));
				float lerpResult43 = lerp( lerpResult42 , tex2DNode6.g , (( _MainTex_G )?( 1.0 ):( 0.0 )));
				float lerpResult44 = lerp( lerpResult43 , tex2DNode6.b , (( _MainTex_B )?( 1.0 ):( 0.0 )));
				float4 temp_cast_4 = (lerpResult44).xxxx;
				float4 lerpResult45 = lerp( temp_cast_4 , tex2DNode6 , (( _MainTex_A )?( 1.0 ):( 0.0 )));
				float4 temp_cast_5 = (1.0).xxxx;
				float4 lerpResult8 = lerp( lerpResult45 , temp_cast_5 , _Blend1);
				float mulTime152 = _TimeParameters.x * _MaskTex_xydirzSpeedwPolarC1.z;
				float2 appendResult154 = (float2(_MaskTex_xydirzSpeedwPolarC1.x , _MaskTex_xydirzSpeedwPolarC1.y));
				float2 appendResult78 = (float2(_MaskTex_xyTilingzwOffset.x , _MaskTex_xyTilingzwOffset.y));
				float2 CenteredUV15_g21 = ( IN.ase_texcoord2.xy - float2( 0.5,0.5 ) );
				float2 break17_g21 = CenteredUV15_g21;
				float2 appendResult79 = (float2(_MaskTex_xyTilingzwOffset.z , _MaskTex_xyTilingzwOffset.w));
				float4 texCoord72 = IN.ase_texcoord3;
				texCoord72.xy = IN.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult74 = (float2(texCoord72.z , texCoord72.w));
				#ifdef _USE_CUSTOM1_ZW_MASK_ZWOFFSET_ON
				float2 staticSwitch71 = appendResult74;
				#else
				float2 staticSwitch71 = appendResult79;
				#endif
				float2 break244 = staticSwitch71;
				float ifLocalVar420 = 0;
				ifLocalVar420 = 1.0;
				float2 appendResult23_g21 = (float2(( length( CenteredUV15_g21 ) * 1.0 * 2.0 ) , ( atan2( break17_g21.x , break17_g21.y ) * ( 1.0 / TWO_PI ) * ifLocalVar420 )));
				float2 appendResult419 = (float2(break244.x , break244.y));
				float2 panner156 = ( mulTime152 * appendResult154 + ( appendResult78 * ( 1.0 - ( appendResult23_g21 + appendResult419 ) ) ));
				float2 texCoord64 = IN.ase_texcoord2.xy * appendResult78 + staticSwitch71;
				float2 panner158 = ( mulTime152 * appendResult154 + texCoord64);
				float2 ifLocalVar157 = 0;
				if( _MaskTex_xydirzSpeedwPolarC1.w >= 1.0 )
				ifLocalVar157 = panner156;
				else
				ifLocalVar157 = panner158;
				float smoothstepResult66 = smoothstep( _MaskTex_Transition , ( _MaskTex_Transition + _MaskTex_Smoothness ) , tex2D( _Mask_Tex, ifLocalVar157 ).r);
				#ifdef _MASKACTIVATE_ON
				float staticSwitch265 = smoothstepResult66;
				#else
				float staticSwitch265 = 1.0;
				#endif
				float Mask212 = staticSwitch265;
				float4 texCoord86 = IN.ase_texcoord4;
				texCoord86.xy = IN.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _USE_CUSTOM2_X_DISSOLVETRANSITION_ON
				float staticSwitch83 = texCoord86.x;
				#else
				float staticSwitch83 = _DissolveTex_Transition;
				#endif
				float temp_output_89_0 = ( _DissolveTex_Smoothness + staticSwitch83 );
				float mulTime159 = _TimeParameters.x * _DissolveTex_xydirzSpeedwPolarC1.z;
				float2 appendResult161 = (float2(_DissolveTex_xydirzSpeedwPolarC1.x , _DissolveTex_xydirzSpeedwPolarC1.y));
				float2 appendResult84 = (float2(_DissolveTex_xyTilingzwOffset.x , _DissolveTex_xyTilingzwOffset.y));
				float2 CenteredUV15_g19 = ( IN.ase_texcoord2.xy - float2( 0.5,0.5 ) );
				float2 break17_g19 = CenteredUV15_g19;
				float2 appendResult81 = (float2(_DissolveTex_xyTilingzwOffset.z , _DissolveTex_xyTilingzwOffset.w));
				float2 break208 = appendResult81;
				float ifLocalVar428 = 0;
				ifLocalVar428 = 1.0;
				float2 appendResult23_g19 = (float2(( length( CenteredUV15_g19 ) * 1.0 * 2.0 ) , ( atan2( break17_g19.x , break17_g19.y ) * ( 1.0 / TWO_PI ) * ifLocalVar428 )));
				float2 appendResult429 = (float2(break208.x , break208.y));
				float2 panner163 = ( mulTime159 * appendResult161 + ( appendResult84 * ( 1.0 - ( appendResult23_g19 + appendResult429 ) ) ));
				float2 texCoord85 = IN.ase_texcoord2.xy * appendResult84 + appendResult81;
				float2 panner165 = ( mulTime159 * appendResult161 + texCoord85);
				float2 ifLocalVar164 = 0;
				if( _DissolveTex_xydirzSpeedwPolarC1.w >= 1.0 )
				ifLocalVar164 = panner163;
				else
				ifLocalVar164 = panner165;
				float2 uv_Distort_DissolveTexAdvanceSetting = IN.ase_texcoord2.xy * _Distort_DissolveTexAdvanceSetting_ST.xy + _Distort_DissolveTexAdvanceSetting_ST.zw;
				float4 tex2DNode76 = tex2D( _Dissolve_Tex, ( float4( ifLocalVar164, 0.0 , 0.0 ) + Distort122 + ( tex2D( _Distort_DissolveTexAdvanceSetting, uv_Distort_DissolveTexAdvanceSetting ) * _DistortDissolvePower ) ).rg );
				float smoothstepResult87 = smoothstep( staticSwitch83 , temp_output_89_0 , tex2DNode76.r);
				#ifdef _DISSOLVETEXTURESETTINGS_ON
				float staticSwitch271 = smoothstepResult87;
				#else
				float staticSwitch271 = 1.0;
				#endif
				float DissolveAlpha331 = saturate( staticSwitch271 );
				float4 BaseTex_Mask281 = ( lerpResult8 * Mask212 * IN.ase_color.a * DissolveAlpha331 );
				float4 screenPos = IN.ase_texcoord5;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float screenDepth470 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth470 = saturate( ( screenDepth470 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _SoftParticlesDistance ) );
				#ifdef _SOFTPARTICLEACTIVATE_ON
				float staticSwitch480 = distanceDepth470;
				#else
				float staticSwitch480 = 1.0;
				#endif
				

				float Alpha = ( BaseTex_Mask281 * staticSwitch480 ).r;
				float AlphaClipThreshold = 0.5;

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( IN.clipPos );
				#endif
				return 0;
			}
			ENDHLSL
		}

		
		Pass
		{
			
            Name "SceneSelectionPass"
            Tags { "LightMode"="SceneSelectionPass" }

			Cull Off

			HLSLPROGRAM

			#define _SURFACE_TYPE_TRANSPARENT 1
			#define ASE_SRP_VERSION 140011
			#define REQUIRE_DEPTH_TEXTURE 1


			#pragma vertex vert
			#pragma fragment frag

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#pragma shader_feature_local _USE_CUSTOM1_XY_BASE_ZWOFFSET_ON
			#pragma shader_feature_local _DISTORTTEXTURESETTING_ON
			#pragma shader_feature_local _USE_CUSTOM2_Y_DISTORTPOWER_ON
			#pragma shader_feature_local _MASKACTIVATE_ON
			#pragma shader_feature_local _USE_CUSTOM1_ZW_MASK_ZWOFFSET_ON
			#pragma shader_feature_local _DISSOLVETEXTURESETTINGS_ON
			#pragma shader_feature_local _USE_CUSTOM2_X_DISSOLVETRANSITION_ON
			#pragma shader_feature_local _SOFTPARTICLEACTIVATE_ON


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _DistortTex_xydirzSpeedwPolarC1;
			float4 _R_Light_Color;
			float4 _R_dark_Color;
			float4 _EdgeHighlightColor1;
			float4 _Distort_DissolveTexAdvanceSetting_ST;
			float4 _Distort_Directionxy;
			float4 _Distort_xyTilingzwOffset;
			float4 _BaseTexxyTilingzwOffset;
			float4 _DissolveTex_xyTilingzwOffset;
			float4 _BaseTexxydirzSpeedwPolarC1;
			float4 _ColorTex_xydirzSpeedwPolarC1;
			float4 _MaskTex_xyTilingzwOffset;
			float4 _MaskTex_xydirzSpeedwPolarC1;
			float4 _ColorTex_xyTilingzwOffset;
			float4 _AllColor;
			float4 _DissolveTex_xydirzSpeedwPolarC1;
			float _MainTex_A;
			float _MainTex_B;
			float _MainTex_G;
			float _MainTex_R;
			float _AllPower;
			float _Color_Hue;
			float _Src;
			float _EdgeHighlight;
			float _BaseColor_Transition;
			float _Blend1;
			float _DistortDissolvePower;
			float _DistortPower;
			float _DissolveTex_Smoothness;
			float _DissolveTex_Transition;
			float _MaskTex_Smoothness;
			float _MaskTex_Transition;
			float _ZTestMode;
			float _Dst;
			float _BaseColor_Smoothness;
			float _SoftParticlesDistance;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _Base_Tex;
			sampler2D _Distort_Tex;
			sampler2D _Mask_Tex;
			sampler2D _Dissolve_Tex;
			sampler2D _Distort_DissolveTexAdvanceSetting;
			uniform float4 _CameraDepthTexture_TexelSize;


			
			int _ObjectId;
			int _PassValue;

			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			VertexOutput VertexFunction(VertexInput v  )
			{
				VertexOutput o;
				ZERO_INITIALIZE(VertexOutput, o);

				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float4 ase_clipPos = TransformObjectToHClip((v.vertex).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord3 = screenPos;
				
				o.ase_texcoord.xy = v.ase_texcoord.xy;
				o.ase_texcoord1 = v.ase_texcoord1;
				o.ase_texcoord2 = v.ase_texcoord2;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				o.clipPos = TransformWorldToHClip(positionWS);

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord1 = v.ase_texcoord1;
				o.ase_texcoord2 = v.ase_texcoord2;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				o.ase_texcoord2 = patch[0].ase_texcoord2 * bary.x + patch[1].ase_texcoord2 * bary.y + patch[2].ase_texcoord2 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN ) : SV_TARGET
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				float mulTime145 = _TimeParameters.x * _BaseTexxydirzSpeedwPolarC1.z;
				float2 appendResult143 = (float2(_BaseTexxydirzSpeedwPolarC1.x , _BaseTexxydirzSpeedwPolarC1.y));
				float2 appendResult12 = (float2(_BaseTexxyTilingzwOffset.x , _BaseTexxyTilingzwOffset.y));
				float2 CenteredUV15_g20 = ( IN.ase_texcoord.xy - float2( 0.5,0.5 ) );
				float2 break17_g20 = CenteredUV15_g20;
				float2 appendResult13 = (float2(_BaseTexxyTilingzwOffset.z , _BaseTexxyTilingzwOffset.w));
				float4 texCoord176 = IN.ase_texcoord1;
				texCoord176.xy = IN.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult177 = (float2(texCoord176.x , texCoord176.y));
				#ifdef _USE_CUSTOM1_XY_BASE_ZWOFFSET_ON
				float2 staticSwitch175 = appendResult177;
				#else
				float2 staticSwitch175 = appendResult13;
				#endif
				float2 break184 = staticSwitch175;
				float ifLocalVar412 = 0;
				ifLocalVar412 = 1.0;
				float2 appendResult23_g20 = (float2(( length( CenteredUV15_g20 ) * 1.0 * 2.0 ) , ( atan2( break17_g20.x , break17_g20.y ) * ( 1.0 / TWO_PI ) * ifLocalVar412 )));
				float2 temp_output_141_0 = appendResult23_g20;
				float2 appendResult418 = (float2(break184.x , break184.y));
				float2 panner151 = ( mulTime145 * appendResult143 + ( appendResult12 * ( 1.0 - ( temp_output_141_0 + appendResult418 ) ) ));
				float2 texCoord5 = IN.ase_texcoord.xy * appendResult12 + staticSwitch175;
				float2 panner139 = ( mulTime145 * appendResult143 + texCoord5);
				float2 ifLocalVar144 = 0;
				if( _BaseTexxydirzSpeedwPolarC1.w >= 1.0 )
				ifLocalVar144 = panner151;
				else
				ifLocalVar144 = panner139;
				float4 temp_cast_1 = (0.0).xxxx;
				float mulTime186 = _TimeParameters.x * _DistortTex_xydirzSpeedwPolarC1.z;
				float2 appendResult187 = (float2(_DistortTex_xydirzSpeedwPolarC1.x , _DistortTex_xydirzSpeedwPolarC1.y));
				float2 appendResult117 = (float2(_Distort_xyTilingzwOffset.x , _Distort_xyTilingzwOffset.y));
				float2 CenteredUV15_g18 = ( IN.ase_texcoord.xy - float2( 0.5,0.5 ) );
				float2 break17_g18 = CenteredUV15_g18;
				float2 appendResult118 = (float2(_Distort_xyTilingzwOffset.z , _Distort_xyTilingzwOffset.w));
				float2 break434 = appendResult118;
				float ifLocalVar432 = 0;
				ifLocalVar432 = 1.0;
				float2 appendResult23_g18 = (float2(( length( CenteredUV15_g18 ) * 1.0 * 2.0 ) , ( atan2( break17_g18.x , break17_g18.y ) * ( 1.0 / TWO_PI ) * ifLocalVar432 )));
				float2 appendResult433 = (float2(break434.x , break434.y));
				float2 panner188 = ( mulTime186 * appendResult187 + ( appendResult117 * ( 1.0 - ( appendResult23_g18 + appendResult433 ) ) ));
				float2 texCoord119 = IN.ase_texcoord.xy * appendResult117 + appendResult118;
				float2 panner192 = ( mulTime186 * appendResult187 + texCoord119);
				float2 ifLocalVar191 = 0;
				if( _DistortTex_xydirzSpeedwPolarC1.w >= 1.0 )
				ifLocalVar191 = panner188;
				else
				ifLocalVar191 = panner192;
				float2 appendResult126 = (float2(_Distort_Directionxy.x , _Distort_Directionxy.y));
				float4 texCoord136 = IN.ase_texcoord2;
				texCoord136.xy = IN.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _USE_CUSTOM2_Y_DISTORTPOWER_ON
				float staticSwitch137 = texCoord136.y;
				#else
				float staticSwitch137 = _DistortPower;
				#endif
				#ifdef _DISTORTTEXTURESETTING_ON
				float4 staticSwitch267 = ( tex2D( _Distort_Tex, ifLocalVar191 ) * float4( appendResult126, 0.0 , 0.0 ) * staticSwitch137 );
				#else
				float4 staticSwitch267 = temp_cast_1;
				#endif
				float4 Distort122 = staticSwitch267;
				float4 tex2DNode6 = tex2D( _Base_Tex, ( float4( ifLocalVar144, 0.0 , 0.0 ) + Distort122 ).rg );
				float lerpResult42 = lerp( 0.0 , tex2DNode6.r , (( _MainTex_R )?( 1.0 ):( 0.0 )));
				float lerpResult43 = lerp( lerpResult42 , tex2DNode6.g , (( _MainTex_G )?( 1.0 ):( 0.0 )));
				float lerpResult44 = lerp( lerpResult43 , tex2DNode6.b , (( _MainTex_B )?( 1.0 ):( 0.0 )));
				float4 temp_cast_4 = (lerpResult44).xxxx;
				float4 lerpResult45 = lerp( temp_cast_4 , tex2DNode6 , (( _MainTex_A )?( 1.0 ):( 0.0 )));
				float4 temp_cast_5 = (1.0).xxxx;
				float4 lerpResult8 = lerp( lerpResult45 , temp_cast_5 , _Blend1);
				float mulTime152 = _TimeParameters.x * _MaskTex_xydirzSpeedwPolarC1.z;
				float2 appendResult154 = (float2(_MaskTex_xydirzSpeedwPolarC1.x , _MaskTex_xydirzSpeedwPolarC1.y));
				float2 appendResult78 = (float2(_MaskTex_xyTilingzwOffset.x , _MaskTex_xyTilingzwOffset.y));
				float2 CenteredUV15_g21 = ( IN.ase_texcoord.xy - float2( 0.5,0.5 ) );
				float2 break17_g21 = CenteredUV15_g21;
				float2 appendResult79 = (float2(_MaskTex_xyTilingzwOffset.z , _MaskTex_xyTilingzwOffset.w));
				float4 texCoord72 = IN.ase_texcoord1;
				texCoord72.xy = IN.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult74 = (float2(texCoord72.z , texCoord72.w));
				#ifdef _USE_CUSTOM1_ZW_MASK_ZWOFFSET_ON
				float2 staticSwitch71 = appendResult74;
				#else
				float2 staticSwitch71 = appendResult79;
				#endif
				float2 break244 = staticSwitch71;
				float ifLocalVar420 = 0;
				ifLocalVar420 = 1.0;
				float2 appendResult23_g21 = (float2(( length( CenteredUV15_g21 ) * 1.0 * 2.0 ) , ( atan2( break17_g21.x , break17_g21.y ) * ( 1.0 / TWO_PI ) * ifLocalVar420 )));
				float2 appendResult419 = (float2(break244.x , break244.y));
				float2 panner156 = ( mulTime152 * appendResult154 + ( appendResult78 * ( 1.0 - ( appendResult23_g21 + appendResult419 ) ) ));
				float2 texCoord64 = IN.ase_texcoord.xy * appendResult78 + staticSwitch71;
				float2 panner158 = ( mulTime152 * appendResult154 + texCoord64);
				float2 ifLocalVar157 = 0;
				if( _MaskTex_xydirzSpeedwPolarC1.w >= 1.0 )
				ifLocalVar157 = panner156;
				else
				ifLocalVar157 = panner158;
				float smoothstepResult66 = smoothstep( _MaskTex_Transition , ( _MaskTex_Transition + _MaskTex_Smoothness ) , tex2D( _Mask_Tex, ifLocalVar157 ).r);
				#ifdef _MASKACTIVATE_ON
				float staticSwitch265 = smoothstepResult66;
				#else
				float staticSwitch265 = 1.0;
				#endif
				float Mask212 = staticSwitch265;
				float4 texCoord86 = IN.ase_texcoord2;
				texCoord86.xy = IN.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _USE_CUSTOM2_X_DISSOLVETRANSITION_ON
				float staticSwitch83 = texCoord86.x;
				#else
				float staticSwitch83 = _DissolveTex_Transition;
				#endif
				float temp_output_89_0 = ( _DissolveTex_Smoothness + staticSwitch83 );
				float mulTime159 = _TimeParameters.x * _DissolveTex_xydirzSpeedwPolarC1.z;
				float2 appendResult161 = (float2(_DissolveTex_xydirzSpeedwPolarC1.x , _DissolveTex_xydirzSpeedwPolarC1.y));
				float2 appendResult84 = (float2(_DissolveTex_xyTilingzwOffset.x , _DissolveTex_xyTilingzwOffset.y));
				float2 CenteredUV15_g19 = ( IN.ase_texcoord.xy - float2( 0.5,0.5 ) );
				float2 break17_g19 = CenteredUV15_g19;
				float2 appendResult81 = (float2(_DissolveTex_xyTilingzwOffset.z , _DissolveTex_xyTilingzwOffset.w));
				float2 break208 = appendResult81;
				float ifLocalVar428 = 0;
				ifLocalVar428 = 1.0;
				float2 appendResult23_g19 = (float2(( length( CenteredUV15_g19 ) * 1.0 * 2.0 ) , ( atan2( break17_g19.x , break17_g19.y ) * ( 1.0 / TWO_PI ) * ifLocalVar428 )));
				float2 appendResult429 = (float2(break208.x , break208.y));
				float2 panner163 = ( mulTime159 * appendResult161 + ( appendResult84 * ( 1.0 - ( appendResult23_g19 + appendResult429 ) ) ));
				float2 texCoord85 = IN.ase_texcoord.xy * appendResult84 + appendResult81;
				float2 panner165 = ( mulTime159 * appendResult161 + texCoord85);
				float2 ifLocalVar164 = 0;
				if( _DissolveTex_xydirzSpeedwPolarC1.w >= 1.0 )
				ifLocalVar164 = panner163;
				else
				ifLocalVar164 = panner165;
				float2 uv_Distort_DissolveTexAdvanceSetting = IN.ase_texcoord.xy * _Distort_DissolveTexAdvanceSetting_ST.xy + _Distort_DissolveTexAdvanceSetting_ST.zw;
				float4 tex2DNode76 = tex2D( _Dissolve_Tex, ( float4( ifLocalVar164, 0.0 , 0.0 ) + Distort122 + ( tex2D( _Distort_DissolveTexAdvanceSetting, uv_Distort_DissolveTexAdvanceSetting ) * _DistortDissolvePower ) ).rg );
				float smoothstepResult87 = smoothstep( staticSwitch83 , temp_output_89_0 , tex2DNode76.r);
				#ifdef _DISSOLVETEXTURESETTINGS_ON
				float staticSwitch271 = smoothstepResult87;
				#else
				float staticSwitch271 = 1.0;
				#endif
				float DissolveAlpha331 = saturate( staticSwitch271 );
				float4 BaseTex_Mask281 = ( lerpResult8 * Mask212 * IN.ase_color.a * DissolveAlpha331 );
				float4 screenPos = IN.ase_texcoord3;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float screenDepth470 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth470 = saturate( ( screenDepth470 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _SoftParticlesDistance ) );
				#ifdef _SOFTPARTICLEACTIVATE_ON
				float staticSwitch480 = distanceDepth470;
				#else
				float staticSwitch480 = 1.0;
				#endif
				

				surfaceDescription.Alpha = ( BaseTex_Mask281 * staticSwitch480 ).r;
				surfaceDescription.AlphaClipThreshold = 0.5;

				#if _ALPHATEST_ON
					float alphaClipThreshold = 0.01f;
					#if ALPHA_CLIP_THRESHOLD
						alphaClipThreshold = surfaceDescription.AlphaClipThreshold;
					#endif
					clip(surfaceDescription.Alpha - alphaClipThreshold);
				#endif

				half4 outColor = half4(_ObjectId, _PassValue, 1.0, 1.0);
				return outColor;
			}
			ENDHLSL
		}

		
		Pass
		{
			
            Name "ScenePickingPass"
            Tags { "LightMode"="Picking" }

			HLSLPROGRAM

			#define _SURFACE_TYPE_TRANSPARENT 1
			#define ASE_SRP_VERSION 140011
			#define REQUIRE_DEPTH_TEXTURE 1


			#pragma vertex vert
			#pragma fragment frag

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#pragma shader_feature_local _USE_CUSTOM1_XY_BASE_ZWOFFSET_ON
			#pragma shader_feature_local _DISTORTTEXTURESETTING_ON
			#pragma shader_feature_local _USE_CUSTOM2_Y_DISTORTPOWER_ON
			#pragma shader_feature_local _MASKACTIVATE_ON
			#pragma shader_feature_local _USE_CUSTOM1_ZW_MASK_ZWOFFSET_ON
			#pragma shader_feature_local _DISSOLVETEXTURESETTINGS_ON
			#pragma shader_feature_local _USE_CUSTOM2_X_DISSOLVETRANSITION_ON
			#pragma shader_feature_local _SOFTPARTICLEACTIVATE_ON


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _DistortTex_xydirzSpeedwPolarC1;
			float4 _R_Light_Color;
			float4 _R_dark_Color;
			float4 _EdgeHighlightColor1;
			float4 _Distort_DissolveTexAdvanceSetting_ST;
			float4 _Distort_Directionxy;
			float4 _Distort_xyTilingzwOffset;
			float4 _BaseTexxyTilingzwOffset;
			float4 _DissolveTex_xyTilingzwOffset;
			float4 _BaseTexxydirzSpeedwPolarC1;
			float4 _ColorTex_xydirzSpeedwPolarC1;
			float4 _MaskTex_xyTilingzwOffset;
			float4 _MaskTex_xydirzSpeedwPolarC1;
			float4 _ColorTex_xyTilingzwOffset;
			float4 _AllColor;
			float4 _DissolveTex_xydirzSpeedwPolarC1;
			float _MainTex_A;
			float _MainTex_B;
			float _MainTex_G;
			float _MainTex_R;
			float _AllPower;
			float _Color_Hue;
			float _Src;
			float _EdgeHighlight;
			float _BaseColor_Transition;
			float _Blend1;
			float _DistortDissolvePower;
			float _DistortPower;
			float _DissolveTex_Smoothness;
			float _DissolveTex_Transition;
			float _MaskTex_Smoothness;
			float _MaskTex_Transition;
			float _ZTestMode;
			float _Dst;
			float _BaseColor_Smoothness;
			float _SoftParticlesDistance;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _Base_Tex;
			sampler2D _Distort_Tex;
			sampler2D _Mask_Tex;
			sampler2D _Dissolve_Tex;
			sampler2D _Distort_DissolveTexAdvanceSetting;
			uniform float4 _CameraDepthTexture_TexelSize;


			
			float4 _SelectionID;


			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			VertexOutput VertexFunction(VertexInput v  )
			{
				VertexOutput o;
				ZERO_INITIALIZE(VertexOutput, o);

				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float4 ase_clipPos = TransformObjectToHClip((v.vertex).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord3 = screenPos;
				
				o.ase_texcoord.xy = v.ase_texcoord.xy;
				o.ase_texcoord1 = v.ase_texcoord1;
				o.ase_texcoord2 = v.ase_texcoord2;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = defaultVertexValue;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif
				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				o.clipPos = TransformWorldToHClip(positionWS);
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord1 = v.ase_texcoord1;
				o.ase_texcoord2 = v.ase_texcoord2;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				o.ase_texcoord2 = patch[0].ase_texcoord2 * bary.x + patch[1].ase_texcoord2 * bary.y + patch[2].ase_texcoord2 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN ) : SV_TARGET
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				float mulTime145 = _TimeParameters.x * _BaseTexxydirzSpeedwPolarC1.z;
				float2 appendResult143 = (float2(_BaseTexxydirzSpeedwPolarC1.x , _BaseTexxydirzSpeedwPolarC1.y));
				float2 appendResult12 = (float2(_BaseTexxyTilingzwOffset.x , _BaseTexxyTilingzwOffset.y));
				float2 CenteredUV15_g20 = ( IN.ase_texcoord.xy - float2( 0.5,0.5 ) );
				float2 break17_g20 = CenteredUV15_g20;
				float2 appendResult13 = (float2(_BaseTexxyTilingzwOffset.z , _BaseTexxyTilingzwOffset.w));
				float4 texCoord176 = IN.ase_texcoord1;
				texCoord176.xy = IN.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult177 = (float2(texCoord176.x , texCoord176.y));
				#ifdef _USE_CUSTOM1_XY_BASE_ZWOFFSET_ON
				float2 staticSwitch175 = appendResult177;
				#else
				float2 staticSwitch175 = appendResult13;
				#endif
				float2 break184 = staticSwitch175;
				float ifLocalVar412 = 0;
				ifLocalVar412 = 1.0;
				float2 appendResult23_g20 = (float2(( length( CenteredUV15_g20 ) * 1.0 * 2.0 ) , ( atan2( break17_g20.x , break17_g20.y ) * ( 1.0 / TWO_PI ) * ifLocalVar412 )));
				float2 temp_output_141_0 = appendResult23_g20;
				float2 appendResult418 = (float2(break184.x , break184.y));
				float2 panner151 = ( mulTime145 * appendResult143 + ( appendResult12 * ( 1.0 - ( temp_output_141_0 + appendResult418 ) ) ));
				float2 texCoord5 = IN.ase_texcoord.xy * appendResult12 + staticSwitch175;
				float2 panner139 = ( mulTime145 * appendResult143 + texCoord5);
				float2 ifLocalVar144 = 0;
				if( _BaseTexxydirzSpeedwPolarC1.w >= 1.0 )
				ifLocalVar144 = panner151;
				else
				ifLocalVar144 = panner139;
				float4 temp_cast_1 = (0.0).xxxx;
				float mulTime186 = _TimeParameters.x * _DistortTex_xydirzSpeedwPolarC1.z;
				float2 appendResult187 = (float2(_DistortTex_xydirzSpeedwPolarC1.x , _DistortTex_xydirzSpeedwPolarC1.y));
				float2 appendResult117 = (float2(_Distort_xyTilingzwOffset.x , _Distort_xyTilingzwOffset.y));
				float2 CenteredUV15_g18 = ( IN.ase_texcoord.xy - float2( 0.5,0.5 ) );
				float2 break17_g18 = CenteredUV15_g18;
				float2 appendResult118 = (float2(_Distort_xyTilingzwOffset.z , _Distort_xyTilingzwOffset.w));
				float2 break434 = appendResult118;
				float ifLocalVar432 = 0;
				ifLocalVar432 = 1.0;
				float2 appendResult23_g18 = (float2(( length( CenteredUV15_g18 ) * 1.0 * 2.0 ) , ( atan2( break17_g18.x , break17_g18.y ) * ( 1.0 / TWO_PI ) * ifLocalVar432 )));
				float2 appendResult433 = (float2(break434.x , break434.y));
				float2 panner188 = ( mulTime186 * appendResult187 + ( appendResult117 * ( 1.0 - ( appendResult23_g18 + appendResult433 ) ) ));
				float2 texCoord119 = IN.ase_texcoord.xy * appendResult117 + appendResult118;
				float2 panner192 = ( mulTime186 * appendResult187 + texCoord119);
				float2 ifLocalVar191 = 0;
				if( _DistortTex_xydirzSpeedwPolarC1.w >= 1.0 )
				ifLocalVar191 = panner188;
				else
				ifLocalVar191 = panner192;
				float2 appendResult126 = (float2(_Distort_Directionxy.x , _Distort_Directionxy.y));
				float4 texCoord136 = IN.ase_texcoord2;
				texCoord136.xy = IN.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _USE_CUSTOM2_Y_DISTORTPOWER_ON
				float staticSwitch137 = texCoord136.y;
				#else
				float staticSwitch137 = _DistortPower;
				#endif
				#ifdef _DISTORTTEXTURESETTING_ON
				float4 staticSwitch267 = ( tex2D( _Distort_Tex, ifLocalVar191 ) * float4( appendResult126, 0.0 , 0.0 ) * staticSwitch137 );
				#else
				float4 staticSwitch267 = temp_cast_1;
				#endif
				float4 Distort122 = staticSwitch267;
				float4 tex2DNode6 = tex2D( _Base_Tex, ( float4( ifLocalVar144, 0.0 , 0.0 ) + Distort122 ).rg );
				float lerpResult42 = lerp( 0.0 , tex2DNode6.r , (( _MainTex_R )?( 1.0 ):( 0.0 )));
				float lerpResult43 = lerp( lerpResult42 , tex2DNode6.g , (( _MainTex_G )?( 1.0 ):( 0.0 )));
				float lerpResult44 = lerp( lerpResult43 , tex2DNode6.b , (( _MainTex_B )?( 1.0 ):( 0.0 )));
				float4 temp_cast_4 = (lerpResult44).xxxx;
				float4 lerpResult45 = lerp( temp_cast_4 , tex2DNode6 , (( _MainTex_A )?( 1.0 ):( 0.0 )));
				float4 temp_cast_5 = (1.0).xxxx;
				float4 lerpResult8 = lerp( lerpResult45 , temp_cast_5 , _Blend1);
				float mulTime152 = _TimeParameters.x * _MaskTex_xydirzSpeedwPolarC1.z;
				float2 appendResult154 = (float2(_MaskTex_xydirzSpeedwPolarC1.x , _MaskTex_xydirzSpeedwPolarC1.y));
				float2 appendResult78 = (float2(_MaskTex_xyTilingzwOffset.x , _MaskTex_xyTilingzwOffset.y));
				float2 CenteredUV15_g21 = ( IN.ase_texcoord.xy - float2( 0.5,0.5 ) );
				float2 break17_g21 = CenteredUV15_g21;
				float2 appendResult79 = (float2(_MaskTex_xyTilingzwOffset.z , _MaskTex_xyTilingzwOffset.w));
				float4 texCoord72 = IN.ase_texcoord1;
				texCoord72.xy = IN.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult74 = (float2(texCoord72.z , texCoord72.w));
				#ifdef _USE_CUSTOM1_ZW_MASK_ZWOFFSET_ON
				float2 staticSwitch71 = appendResult74;
				#else
				float2 staticSwitch71 = appendResult79;
				#endif
				float2 break244 = staticSwitch71;
				float ifLocalVar420 = 0;
				ifLocalVar420 = 1.0;
				float2 appendResult23_g21 = (float2(( length( CenteredUV15_g21 ) * 1.0 * 2.0 ) , ( atan2( break17_g21.x , break17_g21.y ) * ( 1.0 / TWO_PI ) * ifLocalVar420 )));
				float2 appendResult419 = (float2(break244.x , break244.y));
				float2 panner156 = ( mulTime152 * appendResult154 + ( appendResult78 * ( 1.0 - ( appendResult23_g21 + appendResult419 ) ) ));
				float2 texCoord64 = IN.ase_texcoord.xy * appendResult78 + staticSwitch71;
				float2 panner158 = ( mulTime152 * appendResult154 + texCoord64);
				float2 ifLocalVar157 = 0;
				if( _MaskTex_xydirzSpeedwPolarC1.w >= 1.0 )
				ifLocalVar157 = panner156;
				else
				ifLocalVar157 = panner158;
				float smoothstepResult66 = smoothstep( _MaskTex_Transition , ( _MaskTex_Transition + _MaskTex_Smoothness ) , tex2D( _Mask_Tex, ifLocalVar157 ).r);
				#ifdef _MASKACTIVATE_ON
				float staticSwitch265 = smoothstepResult66;
				#else
				float staticSwitch265 = 1.0;
				#endif
				float Mask212 = staticSwitch265;
				float4 texCoord86 = IN.ase_texcoord2;
				texCoord86.xy = IN.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _USE_CUSTOM2_X_DISSOLVETRANSITION_ON
				float staticSwitch83 = texCoord86.x;
				#else
				float staticSwitch83 = _DissolveTex_Transition;
				#endif
				float temp_output_89_0 = ( _DissolveTex_Smoothness + staticSwitch83 );
				float mulTime159 = _TimeParameters.x * _DissolveTex_xydirzSpeedwPolarC1.z;
				float2 appendResult161 = (float2(_DissolveTex_xydirzSpeedwPolarC1.x , _DissolveTex_xydirzSpeedwPolarC1.y));
				float2 appendResult84 = (float2(_DissolveTex_xyTilingzwOffset.x , _DissolveTex_xyTilingzwOffset.y));
				float2 CenteredUV15_g19 = ( IN.ase_texcoord.xy - float2( 0.5,0.5 ) );
				float2 break17_g19 = CenteredUV15_g19;
				float2 appendResult81 = (float2(_DissolveTex_xyTilingzwOffset.z , _DissolveTex_xyTilingzwOffset.w));
				float2 break208 = appendResult81;
				float ifLocalVar428 = 0;
				ifLocalVar428 = 1.0;
				float2 appendResult23_g19 = (float2(( length( CenteredUV15_g19 ) * 1.0 * 2.0 ) , ( atan2( break17_g19.x , break17_g19.y ) * ( 1.0 / TWO_PI ) * ifLocalVar428 )));
				float2 appendResult429 = (float2(break208.x , break208.y));
				float2 panner163 = ( mulTime159 * appendResult161 + ( appendResult84 * ( 1.0 - ( appendResult23_g19 + appendResult429 ) ) ));
				float2 texCoord85 = IN.ase_texcoord.xy * appendResult84 + appendResult81;
				float2 panner165 = ( mulTime159 * appendResult161 + texCoord85);
				float2 ifLocalVar164 = 0;
				if( _DissolveTex_xydirzSpeedwPolarC1.w >= 1.0 )
				ifLocalVar164 = panner163;
				else
				ifLocalVar164 = panner165;
				float2 uv_Distort_DissolveTexAdvanceSetting = IN.ase_texcoord.xy * _Distort_DissolveTexAdvanceSetting_ST.xy + _Distort_DissolveTexAdvanceSetting_ST.zw;
				float4 tex2DNode76 = tex2D( _Dissolve_Tex, ( float4( ifLocalVar164, 0.0 , 0.0 ) + Distort122 + ( tex2D( _Distort_DissolveTexAdvanceSetting, uv_Distort_DissolveTexAdvanceSetting ) * _DistortDissolvePower ) ).rg );
				float smoothstepResult87 = smoothstep( staticSwitch83 , temp_output_89_0 , tex2DNode76.r);
				#ifdef _DISSOLVETEXTURESETTINGS_ON
				float staticSwitch271 = smoothstepResult87;
				#else
				float staticSwitch271 = 1.0;
				#endif
				float DissolveAlpha331 = saturate( staticSwitch271 );
				float4 BaseTex_Mask281 = ( lerpResult8 * Mask212 * IN.ase_color.a * DissolveAlpha331 );
				float4 screenPos = IN.ase_texcoord3;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float screenDepth470 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth470 = saturate( ( screenDepth470 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _SoftParticlesDistance ) );
				#ifdef _SOFTPARTICLEACTIVATE_ON
				float staticSwitch480 = distanceDepth470;
				#else
				float staticSwitch480 = 1.0;
				#endif
				

				surfaceDescription.Alpha = ( BaseTex_Mask281 * staticSwitch480 ).r;
				surfaceDescription.AlphaClipThreshold = 0.5;

				#if _ALPHATEST_ON
					float alphaClipThreshold = 0.01f;
					#if ALPHA_CLIP_THRESHOLD
						alphaClipThreshold = surfaceDescription.AlphaClipThreshold;
					#endif
					clip(surfaceDescription.Alpha - alphaClipThreshold);
				#endif

				half4 outColor = 0;
				outColor = _SelectionID;

				return outColor;
			}

			ENDHLSL
		}

		
		Pass
		{
			
            Name "DepthNormals"
            Tags { "LightMode"="DepthNormalsOnly" }

			ZTest LEqual
			ZWrite On


			HLSLPROGRAM

			#define _SURFACE_TYPE_TRANSPARENT 1
			#define ASE_SRP_VERSION 140011
			#define REQUIRE_DEPTH_TEXTURE 1


			#pragma vertex vert
			#pragma fragment frag

			#pragma multi_compile_fragment _ _WRITE_RENDERING_LAYERS
        	#pragma multi_compile_fragment _ _GBUFFER_NORMALS_OCT

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define VARYINGS_NEED_NORMAL_WS

			#define SHADERPASS SHADERPASS_DEPTHNORMALSONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"

			#pragma shader_feature_local _USE_CUSTOM1_XY_BASE_ZWOFFSET_ON
			#pragma shader_feature_local _DISTORTTEXTURESETTING_ON
			#pragma shader_feature_local _USE_CUSTOM2_Y_DISTORTPOWER_ON
			#pragma shader_feature_local _MASKACTIVATE_ON
			#pragma shader_feature_local _USE_CUSTOM1_ZW_MASK_ZWOFFSET_ON
			#pragma shader_feature_local _DISSOLVETEXTURESETTINGS_ON
			#pragma shader_feature_local _USE_CUSTOM2_X_DISSOLVETRANSITION_ON
			#pragma shader_feature_local _SOFTPARTICLEACTIVATE_ON


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				float3 normalWS : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord4 : TEXCOORD4;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _DistortTex_xydirzSpeedwPolarC1;
			float4 _R_Light_Color;
			float4 _R_dark_Color;
			float4 _EdgeHighlightColor1;
			float4 _Distort_DissolveTexAdvanceSetting_ST;
			float4 _Distort_Directionxy;
			float4 _Distort_xyTilingzwOffset;
			float4 _BaseTexxyTilingzwOffset;
			float4 _DissolveTex_xyTilingzwOffset;
			float4 _BaseTexxydirzSpeedwPolarC1;
			float4 _ColorTex_xydirzSpeedwPolarC1;
			float4 _MaskTex_xyTilingzwOffset;
			float4 _MaskTex_xydirzSpeedwPolarC1;
			float4 _ColorTex_xyTilingzwOffset;
			float4 _AllColor;
			float4 _DissolveTex_xydirzSpeedwPolarC1;
			float _MainTex_A;
			float _MainTex_B;
			float _MainTex_G;
			float _MainTex_R;
			float _AllPower;
			float _Color_Hue;
			float _Src;
			float _EdgeHighlight;
			float _BaseColor_Transition;
			float _Blend1;
			float _DistortDissolvePower;
			float _DistortPower;
			float _DissolveTex_Smoothness;
			float _DissolveTex_Transition;
			float _MaskTex_Smoothness;
			float _MaskTex_Transition;
			float _ZTestMode;
			float _Dst;
			float _BaseColor_Smoothness;
			float _SoftParticlesDistance;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _Base_Tex;
			sampler2D _Distort_Tex;
			sampler2D _Mask_Tex;
			sampler2D _Dissolve_Tex;
			sampler2D _Distort_DissolveTexAdvanceSetting;
			uniform float4 _CameraDepthTexture_TexelSize;


			
			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			VertexOutput VertexFunction(VertexInput v  )
			{
				VertexOutput o;
				ZERO_INITIALIZE(VertexOutput, o);

				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float4 ase_clipPos = TransformObjectToHClip((v.vertex).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord4 = screenPos;
				
				o.ase_texcoord1.xy = v.ase_texcoord.xy;
				o.ase_texcoord2 = v.ase_texcoord1;
				o.ase_texcoord3 = v.ase_texcoord2;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord1.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float3 normalWS = TransformObjectToWorldNormal(v.ase_normal);

				o.clipPos = TransformWorldToHClip(positionWS);
				o.normalWS.xyz =  normalWS;

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord1 = v.ase_texcoord1;
				o.ase_texcoord2 = v.ase_texcoord2;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				o.ase_texcoord2 = patch[0].ase_texcoord2 * bary.x + patch[1].ase_texcoord2 * bary.y + patch[2].ase_texcoord2 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			void frag( VertexOutput IN
				, out half4 outNormalWS : SV_Target0
			#ifdef _WRITE_RENDERING_LAYERS
				, out float4 outRenderingLayers : SV_Target1
			#endif
				 )
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				float mulTime145 = _TimeParameters.x * _BaseTexxydirzSpeedwPolarC1.z;
				float2 appendResult143 = (float2(_BaseTexxydirzSpeedwPolarC1.x , _BaseTexxydirzSpeedwPolarC1.y));
				float2 appendResult12 = (float2(_BaseTexxyTilingzwOffset.x , _BaseTexxyTilingzwOffset.y));
				float2 CenteredUV15_g20 = ( IN.ase_texcoord1.xy - float2( 0.5,0.5 ) );
				float2 break17_g20 = CenteredUV15_g20;
				float2 appendResult13 = (float2(_BaseTexxyTilingzwOffset.z , _BaseTexxyTilingzwOffset.w));
				float4 texCoord176 = IN.ase_texcoord2;
				texCoord176.xy = IN.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult177 = (float2(texCoord176.x , texCoord176.y));
				#ifdef _USE_CUSTOM1_XY_BASE_ZWOFFSET_ON
				float2 staticSwitch175 = appendResult177;
				#else
				float2 staticSwitch175 = appendResult13;
				#endif
				float2 break184 = staticSwitch175;
				float ifLocalVar412 = 0;
				ifLocalVar412 = 1.0;
				float2 appendResult23_g20 = (float2(( length( CenteredUV15_g20 ) * 1.0 * 2.0 ) , ( atan2( break17_g20.x , break17_g20.y ) * ( 1.0 / TWO_PI ) * ifLocalVar412 )));
				float2 temp_output_141_0 = appendResult23_g20;
				float2 appendResult418 = (float2(break184.x , break184.y));
				float2 panner151 = ( mulTime145 * appendResult143 + ( appendResult12 * ( 1.0 - ( temp_output_141_0 + appendResult418 ) ) ));
				float2 texCoord5 = IN.ase_texcoord1.xy * appendResult12 + staticSwitch175;
				float2 panner139 = ( mulTime145 * appendResult143 + texCoord5);
				float2 ifLocalVar144 = 0;
				if( _BaseTexxydirzSpeedwPolarC1.w >= 1.0 )
				ifLocalVar144 = panner151;
				else
				ifLocalVar144 = panner139;
				float4 temp_cast_1 = (0.0).xxxx;
				float mulTime186 = _TimeParameters.x * _DistortTex_xydirzSpeedwPolarC1.z;
				float2 appendResult187 = (float2(_DistortTex_xydirzSpeedwPolarC1.x , _DistortTex_xydirzSpeedwPolarC1.y));
				float2 appendResult117 = (float2(_Distort_xyTilingzwOffset.x , _Distort_xyTilingzwOffset.y));
				float2 CenteredUV15_g18 = ( IN.ase_texcoord1.xy - float2( 0.5,0.5 ) );
				float2 break17_g18 = CenteredUV15_g18;
				float2 appendResult118 = (float2(_Distort_xyTilingzwOffset.z , _Distort_xyTilingzwOffset.w));
				float2 break434 = appendResult118;
				float ifLocalVar432 = 0;
				ifLocalVar432 = 1.0;
				float2 appendResult23_g18 = (float2(( length( CenteredUV15_g18 ) * 1.0 * 2.0 ) , ( atan2( break17_g18.x , break17_g18.y ) * ( 1.0 / TWO_PI ) * ifLocalVar432 )));
				float2 appendResult433 = (float2(break434.x , break434.y));
				float2 panner188 = ( mulTime186 * appendResult187 + ( appendResult117 * ( 1.0 - ( appendResult23_g18 + appendResult433 ) ) ));
				float2 texCoord119 = IN.ase_texcoord1.xy * appendResult117 + appendResult118;
				float2 panner192 = ( mulTime186 * appendResult187 + texCoord119);
				float2 ifLocalVar191 = 0;
				if( _DistortTex_xydirzSpeedwPolarC1.w >= 1.0 )
				ifLocalVar191 = panner188;
				else
				ifLocalVar191 = panner192;
				float2 appendResult126 = (float2(_Distort_Directionxy.x , _Distort_Directionxy.y));
				float4 texCoord136 = IN.ase_texcoord3;
				texCoord136.xy = IN.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _USE_CUSTOM2_Y_DISTORTPOWER_ON
				float staticSwitch137 = texCoord136.y;
				#else
				float staticSwitch137 = _DistortPower;
				#endif
				#ifdef _DISTORTTEXTURESETTING_ON
				float4 staticSwitch267 = ( tex2D( _Distort_Tex, ifLocalVar191 ) * float4( appendResult126, 0.0 , 0.0 ) * staticSwitch137 );
				#else
				float4 staticSwitch267 = temp_cast_1;
				#endif
				float4 Distort122 = staticSwitch267;
				float4 tex2DNode6 = tex2D( _Base_Tex, ( float4( ifLocalVar144, 0.0 , 0.0 ) + Distort122 ).rg );
				float lerpResult42 = lerp( 0.0 , tex2DNode6.r , (( _MainTex_R )?( 1.0 ):( 0.0 )));
				float lerpResult43 = lerp( lerpResult42 , tex2DNode6.g , (( _MainTex_G )?( 1.0 ):( 0.0 )));
				float lerpResult44 = lerp( lerpResult43 , tex2DNode6.b , (( _MainTex_B )?( 1.0 ):( 0.0 )));
				float4 temp_cast_4 = (lerpResult44).xxxx;
				float4 lerpResult45 = lerp( temp_cast_4 , tex2DNode6 , (( _MainTex_A )?( 1.0 ):( 0.0 )));
				float4 temp_cast_5 = (1.0).xxxx;
				float4 lerpResult8 = lerp( lerpResult45 , temp_cast_5 , _Blend1);
				float mulTime152 = _TimeParameters.x * _MaskTex_xydirzSpeedwPolarC1.z;
				float2 appendResult154 = (float2(_MaskTex_xydirzSpeedwPolarC1.x , _MaskTex_xydirzSpeedwPolarC1.y));
				float2 appendResult78 = (float2(_MaskTex_xyTilingzwOffset.x , _MaskTex_xyTilingzwOffset.y));
				float2 CenteredUV15_g21 = ( IN.ase_texcoord1.xy - float2( 0.5,0.5 ) );
				float2 break17_g21 = CenteredUV15_g21;
				float2 appendResult79 = (float2(_MaskTex_xyTilingzwOffset.z , _MaskTex_xyTilingzwOffset.w));
				float4 texCoord72 = IN.ase_texcoord2;
				texCoord72.xy = IN.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult74 = (float2(texCoord72.z , texCoord72.w));
				#ifdef _USE_CUSTOM1_ZW_MASK_ZWOFFSET_ON
				float2 staticSwitch71 = appendResult74;
				#else
				float2 staticSwitch71 = appendResult79;
				#endif
				float2 break244 = staticSwitch71;
				float ifLocalVar420 = 0;
				ifLocalVar420 = 1.0;
				float2 appendResult23_g21 = (float2(( length( CenteredUV15_g21 ) * 1.0 * 2.0 ) , ( atan2( break17_g21.x , break17_g21.y ) * ( 1.0 / TWO_PI ) * ifLocalVar420 )));
				float2 appendResult419 = (float2(break244.x , break244.y));
				float2 panner156 = ( mulTime152 * appendResult154 + ( appendResult78 * ( 1.0 - ( appendResult23_g21 + appendResult419 ) ) ));
				float2 texCoord64 = IN.ase_texcoord1.xy * appendResult78 + staticSwitch71;
				float2 panner158 = ( mulTime152 * appendResult154 + texCoord64);
				float2 ifLocalVar157 = 0;
				if( _MaskTex_xydirzSpeedwPolarC1.w >= 1.0 )
				ifLocalVar157 = panner156;
				else
				ifLocalVar157 = panner158;
				float smoothstepResult66 = smoothstep( _MaskTex_Transition , ( _MaskTex_Transition + _MaskTex_Smoothness ) , tex2D( _Mask_Tex, ifLocalVar157 ).r);
				#ifdef _MASKACTIVATE_ON
				float staticSwitch265 = smoothstepResult66;
				#else
				float staticSwitch265 = 1.0;
				#endif
				float Mask212 = staticSwitch265;
				float4 texCoord86 = IN.ase_texcoord3;
				texCoord86.xy = IN.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _USE_CUSTOM2_X_DISSOLVETRANSITION_ON
				float staticSwitch83 = texCoord86.x;
				#else
				float staticSwitch83 = _DissolveTex_Transition;
				#endif
				float temp_output_89_0 = ( _DissolveTex_Smoothness + staticSwitch83 );
				float mulTime159 = _TimeParameters.x * _DissolveTex_xydirzSpeedwPolarC1.z;
				float2 appendResult161 = (float2(_DissolveTex_xydirzSpeedwPolarC1.x , _DissolveTex_xydirzSpeedwPolarC1.y));
				float2 appendResult84 = (float2(_DissolveTex_xyTilingzwOffset.x , _DissolveTex_xyTilingzwOffset.y));
				float2 CenteredUV15_g19 = ( IN.ase_texcoord1.xy - float2( 0.5,0.5 ) );
				float2 break17_g19 = CenteredUV15_g19;
				float2 appendResult81 = (float2(_DissolveTex_xyTilingzwOffset.z , _DissolveTex_xyTilingzwOffset.w));
				float2 break208 = appendResult81;
				float ifLocalVar428 = 0;
				ifLocalVar428 = 1.0;
				float2 appendResult23_g19 = (float2(( length( CenteredUV15_g19 ) * 1.0 * 2.0 ) , ( atan2( break17_g19.x , break17_g19.y ) * ( 1.0 / TWO_PI ) * ifLocalVar428 )));
				float2 appendResult429 = (float2(break208.x , break208.y));
				float2 panner163 = ( mulTime159 * appendResult161 + ( appendResult84 * ( 1.0 - ( appendResult23_g19 + appendResult429 ) ) ));
				float2 texCoord85 = IN.ase_texcoord1.xy * appendResult84 + appendResult81;
				float2 panner165 = ( mulTime159 * appendResult161 + texCoord85);
				float2 ifLocalVar164 = 0;
				if( _DissolveTex_xydirzSpeedwPolarC1.w >= 1.0 )
				ifLocalVar164 = panner163;
				else
				ifLocalVar164 = panner165;
				float2 uv_Distort_DissolveTexAdvanceSetting = IN.ase_texcoord1.xy * _Distort_DissolveTexAdvanceSetting_ST.xy + _Distort_DissolveTexAdvanceSetting_ST.zw;
				float4 tex2DNode76 = tex2D( _Dissolve_Tex, ( float4( ifLocalVar164, 0.0 , 0.0 ) + Distort122 + ( tex2D( _Distort_DissolveTexAdvanceSetting, uv_Distort_DissolveTexAdvanceSetting ) * _DistortDissolvePower ) ).rg );
				float smoothstepResult87 = smoothstep( staticSwitch83 , temp_output_89_0 , tex2DNode76.r);
				#ifdef _DISSOLVETEXTURESETTINGS_ON
				float staticSwitch271 = smoothstepResult87;
				#else
				float staticSwitch271 = 1.0;
				#endif
				float DissolveAlpha331 = saturate( staticSwitch271 );
				float4 BaseTex_Mask281 = ( lerpResult8 * Mask212 * IN.ase_color.a * DissolveAlpha331 );
				float4 screenPos = IN.ase_texcoord4;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float screenDepth470 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth470 = saturate( ( screenDepth470 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _SoftParticlesDistance ) );
				#ifdef _SOFTPARTICLEACTIVATE_ON
				float staticSwitch480 = distanceDepth470;
				#else
				float staticSwitch480 = 1.0;
				#endif
				

				surfaceDescription.Alpha = ( BaseTex_Mask281 * staticSwitch480 ).r;
				surfaceDescription.AlphaClipThreshold = 0.5;

				#if _ALPHATEST_ON
					clip(surfaceDescription.Alpha - surfaceDescription.AlphaClipThreshold);
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( IN.clipPos );
				#endif

				#if defined(_GBUFFER_NORMALS_OCT)
					float3 normalWS = normalize(IN.normalWS);
					float2 octNormalWS = PackNormalOctQuadEncode(normalWS);           // values between [-1, +1], must use fp32 on some platforms
					float2 remappedOctNormalWS = saturate(octNormalWS * 0.5 + 0.5);   // values between [ 0,  1]
					half3 packedNormalWS = PackFloat2To888(remappedOctNormalWS);      // values between [ 0,  1]
					outNormalWS = half4(packedNormalWS, 0.0);
				#else
					float3 normalWS = IN.normalWS;
					outNormalWS = half4(NormalizeNormalPerPixel(normalWS), 0.0);
				#endif

				#ifdef _WRITE_RENDERING_LAYERS
					uint renderingLayers = GetMeshRenderingLayer();
					outRenderingLayers = float4(EncodeMeshRenderingLayer(renderingLayers), 0, 0, 0);
				#endif
			}

			ENDHLSL
		}

	
	}
	
	CustomEditor "UnityEditor.ShaderGraphUnlitGUI"
	FallBack "Hidden/Shader Graph/FallbackError"
	
	Fallback "Hidden/InternalErrorShader"
}
/*ASEBEGIN
Version=19105
Node;AmplifyShaderEditor.CommentaryNode;166;-6428.223,2229.127;Inherit;False;3764.905;1080.649;Comment;30;122;125;115;435;434;433;432;431;116;185;267;268;186;187;190;189;192;137;136;191;188;119;117;118;138;124;126;127;135;438;Distorting Texture;1,1,1,1;0;0
Node;AmplifyShaderEditor.Vector4Node;116;-6363.291,2361.041;Inherit;False;Property;_Distort_xyTilingzwOffset;Distort_xy(Tiling),zw(Offset);43;0;Create;True;0;0;0;False;0;False;1,1,0,0;1,1,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;118;-6054.492,2482.74;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;431;-6162.688,3181.411;Inherit;False;Constant;_Float13;Float 9;48;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;434;-5831.374,2829.788;Inherit;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.CommentaryNode;114;-2601.259,-321.9001;Inherit;False;4537.101;846.7049;Comment;45;414;412;142;11;281;206;42;213;194;6;253;141;172;175;176;130;69;5;13;143;184;12;139;202;151;144;9;44;45;145;177;2;0;4;3;43;36;35;37;34;8;10;131;416;418;Base_Tex;1,1,1,1;0;0
Node;AmplifyShaderEditor.ConditionalIfNode;432;-5879.831,3129.982;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;112;-2321.069,2861.073;Inherit;False;4955.653;846.6677;Comment;39;272;205;271;89;87;83;86;237;236;76;123;234;211;208;174;163;161;159;162;160;88;120;164;165;85;84;81;80;331;409;410;411;427;428;429;458;467;468;430;Dissolution;1,1,1,1;0;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;176;-2531.718,-54.58966;Inherit;False;1;-1;4;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;189;-5688.975,3051.397;Inherit;False;Polar Coordinates;-1;;18;7dab8e02884cf104ebefaa2e788e4162;0;4;1;FLOAT2;0,0;False;2;FLOAT2;0.5,0.5;False;3;FLOAT;1;False;4;FLOAT;0.97;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector4Node;11;-2502,-280.5;Inherit;False;Property;_BaseTexxyTilingzwOffset;BaseTex xy(Tiling),zw(Offset);2;0;Create;True;0;0;0;False;0;False;1,1,0,0;6,6,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;433;-5400.582,3132.042;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;113;-2190.301,1726.797;Inherit;False;3313.936;937.0475;Comment;32;421;420;419;71;153;77;212;62;265;266;72;155;156;173;244;152;154;74;128;158;157;129;66;68;67;64;78;79;422;465;466;437;Mask Tex;1,1,1,1;0;0
Node;AmplifyShaderEditor.DynamicAppendNode;177;-2287.29,-30.99257;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;13;-2106.113,-150.6857;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector4Node;80;-2096.65,2965.994;Inherit;False;Property;_DissolveTex_xyTilingzwOffset;DissolveTex_xy(Tiling),zw(Offset);31;0;Create;True;0;0;0;False;0;False;1,1,0,0;1,2,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;435;-5162.277,3080.269;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;81;-1752.851,3094.194;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;117;-6068.792,2381.341;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;72;-2054.299,2065.876;Inherit;False;1;-1;4;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node;185;-6335.272,2647.384;Inherit;False;Property;_DistortTex_xydirzSpeedwPolarC1;DistortTex_xy(dir), z(Speed),w(PolarC-1);44;0;Create;True;0;0;0;False;0;False;1,1,0,0;1,1,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node;77;-2110.908,1814.164;Inherit;False;Property;_MaskTex_xyTilingzwOffset;MaskTex_xy(Tiling),zw(Offset);23;0;Create;True;0;0;0;False;0;False;1,1,0,0;1,1,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StaticSwitch;175;-2063.485,-39.48283;Inherit;False;Property;_use_custom1_xy_base_zwOffset;use_custom1_xy_base_zw(Offset);4;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.OneMinusNode;190;-4979.351,3039.521;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;79;-1810.609,1948.364;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;119;-5822.624,2453.488;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.BreakToComponentsNode;208;-1334.411,3299.495;Inherit;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.BreakToComponentsNode;184;-1760,144;Inherit;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.DynamicAppendNode;74;-1773.132,2155.595;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;187;-5893.258,2634.528;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleTimeNode;186;-5575.712,2781.462;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;414;-2287.19,428.6588;Inherit;False;Constant;_Float9;Float 9;48;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;427;-1794.223,3585.313;Inherit;False;Constant;_Float12;Float 9;48;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;438;-4919.714,2885.551;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;192;-5253.261,2446.938;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StaticSwitch;71;-1587.454,2115.113;Inherit;False;Property;_Use_Custom1_zw_Mask_zwOffset;Use_Custom1_zw_Mask_zw(Offset);28;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ConditionalIfNode;412;-2000.332,333.8016;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;428;-1511.366,3533.885;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;188;-4825.525,2715.343;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ConditionalIfNode;191;-4696.977,2439.164;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;162;-1309.859,3462.163;Inherit;False;Polar Coordinates;-1;;19;7dab8e02884cf104ebefaa2e788e4162;0;4;1;FLOAT2;0,0;False;2;FLOAT2;0.5,0.5;False;3;FLOAT;1;False;4;FLOAT;0.97;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;141;-1805.143,268;Inherit;False;Polar Coordinates;-1;;20;7dab8e02884cf104ebefaa2e788e4162;0;4;1;FLOAT2;0,0;False;2;FLOAT2;0.5,0.5;False;3;FLOAT;1;False;4;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;418;-1541.48,419.5159;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;421;-1771.125,2546.654;Inherit;False;Constant;_Float10;Float 9;48;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;429;-1062.974,3603.943;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.BreakToComponentsNode;244;-1134.218,2218.131;Inherit;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.TextureCoordinatesNode;136;-4251.271,2918.559;Inherit;False;2;-1;4;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node;127;-4064.635,2572.173;Inherit;False;Property;_Distort_Directionxy;Distort_Direction(xy);45;0;Create;True;0;0;0;False;0;False;0.3,0.3,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;135;-4000.546,2806.115;Inherit;False;Property;_DistortPower;Distort Power;46;0;Create;True;0;0;0;False;0;False;0.2;0;-2;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;137;-3633.035,2804.204;Inherit;False;Property;_use_custom2_y_distortPower;use_custom2_y_distortPower;47;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;416;-1340.908,376.0872;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ConditionalIfNode;420;-1488.268,2495.226;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;430;-925.0249,3481.019;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;115;-4255.486,2337.362;Inherit;True;Property;_Distort_Tex;Distort_Tex;42;1;[NoScaleOffset];Create;True;1;Distort Texture Settings;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;126;-3751.636,2499.174;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;84;-1767.151,2992.794;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;124;-3523.28,2336.273;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;174;-1006.825,3402.003;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;12;-2128,-256;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.OneMinusNode;172;-1327.429,252.5714;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;268;-3356.774,2291.801;Inherit;False;Constant;_Float5;Float 5;46;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;142;-2576,176;Inherit;False;Property;_BaseTexxydirzSpeedwPolarC1;BaseTex xy(dir), z(Speed),w(PolarC-1);3;0;Create;True;0;0;0;False;0;False;1,1,0,0;0,0.5,1,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node;160;-2075.229,3262.098;Inherit;False;Property;_DissolveTex_xydirzSpeedwPolarC1;DissolveTex_xy(dir), z(Speed),w(PolarC-1);32;0;Create;True;0;0;0;False;0;False;1,1,0,0;1,1,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;155;-1286.839,2345.681;Inherit;False;Polar Coordinates;-1;;21;7dab8e02884cf104ebefaa2e788e4162;0;4;1;FLOAT2;0,0;False;2;FLOAT2;0.5,0.5;False;3;FLOAT;1;False;4;FLOAT;0.97;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;419;-1009.019,2497.285;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;85;-1595.567,2988.621;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleTimeNode;145;-2239.678,256.2969;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;159;-1576.162,3348.79;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;161;-1588.936,3253.829;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;211;-982.463,3299.51;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;202;-1328,144;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;143;-2064,112;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;5;-1870.286,-245.1429;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;422;-779.8066,2548.698;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StaticSwitch;267;-3239.461,2381.25;Inherit;False;Property;_DistortTextureSetting;Distort Texture Setting;41;0;Create;True;0;0;0;False;2;Header(Distort Texture Setting);Space(10);False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.PannerNode;165;-1181.648,2995.338;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;78;-1824.909,1846.964;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;163;-883.4916,3177.612;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;151;-1344,0;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;139;-1600,-240;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector4Node;153;-2070.743,2318.088;Inherit;False;Property;_MaskTex_xydirzSpeedwPolarC1;MaskTex_xy(dir), z(Speed),w(PolarC-1);24;0;Create;True;0;0;0;False;0;False;1,1,0,0;1,1,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;173;-760.3756,2459.799;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;122;-2906.225,2354.391;Inherit;False;Distort;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;237;-476.8077,3642.284;Inherit;False;Property;_DistortDissolvePower;DistortDissolvePower;40;0;Create;True;0;0;0;False;0;False;0;-0.42;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;234;-791.2007,3521.954;Inherit;True;Property;_Distort_DissolveTexAdvanceSetting;Distort_DissolveTex(AdvanceSetting);39;0;Create;True;0;0;0;False;0;False;-1;None;58d449f1d516c6d46b0aa157e094d229;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;64;-1578.741,1919.111;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ConditionalIfNode;164;-924.4592,2982.572;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ConditionalIfNode;144;-1344,-256;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;123;-737.9246,3046.817;Inherit;False;122;Distort;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.DynamicAppendNode;154;-1612.485,2273.152;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;236;-472.2652,3530.219;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;86;-727.7097,3342.723;Inherit;False;2;-1;4;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleTimeNode;152;-1633.947,2401.609;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;437;-745.4681,2365.987;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;467;-454.5781,3295.649;Inherit;False;Property;_DissolveTex_Transition;DissolveTex_Transition;34;0;Create;True;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;130;-1162.52,-92.24213;Inherit;False;122;Distort;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;120;-524.1464,2967.486;Inherit;True;3;3;0;FLOAT2;0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;131;-1146.359,-243.203;Inherit;False;2;2;0;FLOAT2;0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.PannerNode;158;-967.4187,1922.801;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;468;-419.1492,3364.794;Inherit;False;Property;_DissolveTex_Smoothness;DissolveTex_Smoothness;35;0;Create;True;0;0;0;False;0;False;1;0.04;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;156;-793.1426,2196.672;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StaticSwitch;83;-297.8494,3446.486;Inherit;False;Property;_Use_Custom2_x_DissolveTransition;Use_Custom2_x_DissolveTransition;36;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;34;-689.352,-126.4869;Inherit;False;Property;_MainTex_R;MainTex_R;10;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;157;-685.414,1933.695;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;89;134.0383,3320.385;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;6;-1012.2,-271.9001;Inherit;True;Property;_Base_Tex;Base_Tex;1;2;[Header];[NoScaleOffset];Create;True;1;Base Texture;0;0;False;1;Space(10);False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;76;-284.0445,2952.103;Inherit;True;Property;_Dissolve_Tex;Dissolve_Tex;30;1;[NoScaleOffset];Create;True;1;Dissolve Texture Settings;0;0;False;0;False;-1;None;cdc4540c05f691a4686a19265d50ff13;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;465;-333.983,2241.743;Inherit;False;Property;_MaskTex_Transition;MaskTex_Transition;26;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;466;-337.4116,2334.315;Inherit;False;Property;_MaskTex_Smoothness;MaskTex_Smoothness;27;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;68;76.97377,2125.154;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;35;-687.1777,-31.13985;Inherit;False;Property;_MainTex_G;MainTex_G;11;0;Create;True;0;0;0;False;0;False;1;True;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;87;205.308,2960.379;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;42;-464.2224,-271.2635;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;272;1340.014,2915.079;Inherit;False;Constant;_Float7;Float 7;48;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;62;-117.0813,1862.867;Inherit;True;Property;_Mask_Tex;Mask_Tex;22;1;[NoScaleOffset];Create;True;1;Mask Texture Settings;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SmoothstepOpNode;66;301.8941,1882.929;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;36;-679.9419,70.08038;Inherit;False;Property;_MainTex_B;MainTex_B;12;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;43;-223.8945,-264.1653;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;266;423.4924,1790.419;Inherit;False;Constant;_Float4;Float 4;45;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;271;1525.253,2930.615;Inherit;False;Property;_DissolveTextureSettings;Dissolve Texture Settings;29;0;Create;True;0;0;0;False;2;Header(Dissolve Texture Settings);Space(10);False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;37;-666.2589,167.5812;Inherit;False;Property;_MainTex_A;MainTex_A;13;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;44;-5.568474,-251.444;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;265;621.2294,1864.958;Inherit;False;Property;_MaskActivate;MaskActivate;21;0;Create;True;0;0;0;False;2;Header(Mask Texture Setting);Space(10);False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;458;1895.414,3002.959;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;10;730.9225,-142.2845;Inherit;False;Constant;_Float1;Float 1;2;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;45;266.0018,-242.6556;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;9;602.918,4.466618;Inherit;False;Property;_Blend1;Blend1;0;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;331;2251.034,2932.163;Inherit;True;DissolveAlpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;212;867.7502,1872.728;Inherit;False;Mask;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;8;1103.964,-254.2401;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;213;1073.268,-116.1189;Inherit;False;212;Mask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.VertexColorNode;194;1024.072,184.0809;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;206;1023.102,-9.028244;Inherit;True;331;DissolveAlpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;69;1378.681,-241.0247;Inherit;False;4;4;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;473;2400,80;Inherit;False;Property;_SoftParticlesDistance;SoftParticles Distance;52;0;Create;True;0;0;0;False;1;Space(5);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;281;1692.292,-217.3937;Inherit;True;BaseTex_Mask;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;481;2770.083,-46.63068;Inherit;False;Constant;_Float8;Float 8;54;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DepthFade;470;2688,48;Inherit;False;True;True;False;2;1;FLOAT3;0,0,0;False;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;229;-2406.404,636.5749;Inherit;False;3817.933;924.6284;Comment;33;261;269;15;270;259;260;258;257;232;231;230;225;227;220;228;226;224;223;222;221;218;217;216;215;132;133;327;329;423;424;425;426;436;Color;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;111;-914.3116,3795.754;Inherit;False;4026.529;723.2794;Comment;16;278;108;95;94;93;109;105;101;333;339;445;457;459;460;461;462;EdgeHighlight;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;282;2733.521,-319.6577;Inherit;True;281;BaseTex_Mask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;480;3008,-80;Inherit;False;Property;_SoftParticleActivate;SoftParticle Activate;51;0;Create;True;0;0;0;False;2;Space(5);Header(ParticleSetting);False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;67;-315.8747,2122.146;Inherit;False;Property;_MaskSmoothness;Mask Smoothness;25;0;Create;True;0;0;0;False;0;False;0,1;0,1;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.ColorNode;49;562.5749,-1191.008;Inherit;False;Property;_R_dark_Color;R_dark_Color;9;1;[HDR];Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;41;289.5633,-695.7481;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;39;625.0262,-796.7833;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;138;-4495.308,2464.447;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT2;1,1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;129;-562.2371,2111.944;Inherit;False;122;Distort;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;133;-785.3726,772.7884;Inherit;False;2;2;0;FLOAT2;0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;132;-812.6985,887.4214;Inherit;False;122;Distort;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.ConditionalIfNode;215;-1124.404,799.612;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;217;-1108.404,1199.612;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.OneMinusNode;218;-1108.404,1295.612;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;221;-1380.404,815.612;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;222;-1604.404,815.612;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;223;-1908.405,799.612;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;224;-1924.405,911.6119;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;226;-1844.406,1167.612;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.BreakToComponentsNode;225;-1620.404,1171.613;Inherit;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.ScaleAndOffsetNode;253;-1560.15,277.1089;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;230;-203.3281,966.4501;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;231;-473.2842,1001.222;Inherit;False;Property;_AllColor;AllColor ;20;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,0;15.5802,11.91318,7.96648,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;232;-426.562,1179.274;Inherit;False;Property;_AllPower;All Power;19;0;Create;True;0;0;0;False;0;False;1;0.65;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;258;229.3893,961.0006;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;260;-249.942,1390.481;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;270;386.8701,768.627;Inherit;False;Constant;_Float6;Float 6;47;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;203;3233.518,-655.6811;Inherit;True;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCRemapNode;109;-534.3118,3975.068;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0.25;False;3;FLOAT;0;False;4;FLOAT;0.12;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;95;-37.78223,3929.248;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.09;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;94;127.8777,4066.324;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.08;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;327;924.3177,950.8918;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;47;956.2584,-1175.883;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;309;2957.258,-586.6892;Inherit;True;276;Base_Tex;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;101;1606.602,4074.338;Inherit;True;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;105;1296.482,4253.543;Inherit;False;Property;_EdgeHighlightColor1;EdgeHighlight Color 1;37;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,0;60.08187,29.78276,8.785557,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleSubtractOpNode;333;973.4672,3919.237;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;214;2959.922,-761.2822;Inherit;False;212;Mask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;269;508.7821,875.9459;Inherit;True;Property;_ColorTextureSettings;Color Texture Settings;14;0;Create;True;0;0;0;False;2;Header(Color Texture Settings);Space(10);False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;329;539.7463,1180.606;Inherit;True;205;Dissolve;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;227;-2368.476,1118.612;Inherit;False;Property;_ColorTex_xydirzSpeedwPolarC1;ColorTex_xy(dir), z(Speed),w(PolarC-1);17;0;Create;True;0;0;0;False;1;Tooltip(sdfdsf);False;1,1,0,0;0.71,0.65,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node;228;-2295.183,760.4368;Inherit;False;Property;_ColorTex_xyTilingzwOffset;ColorTex_xy(Tiling),zw(Offset);16;0;Create;True;0;0;0;False;0;False;1,1,0,0;4,3,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;423;-2062.912,1423.885;Inherit;False;Constant;_Float11;Float 9;48;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;424;-1780.055,1372.457;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;425;-1284.806,1432.23;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;426;-1120.429,1381.432;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;15;-530.4974,705.6906;Inherit;True;Property;_Color_Tex;Color_Tex;15;1;[NoScaleOffset];Create;True;1;Color Texture Settings;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;125;-3914.072,2422.044;Inherit;False;Constant;_Float2;Float 2;24;0;Create;True;0;0;0;False;0;False;1.46;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;93;446.3847,3934.736;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;436;-1958.412,1289.564;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;128;-367.3719,1912.627;Inherit;False;2;2;0;FLOAT2;0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;261;1133.316,933.9204;Inherit;False;ColorTex;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.HSVToRGBNode;257;-63.61072,1281.001;Inherit;False;3;0;FLOAT;3.1;False;1;FLOAT;0;False;2;FLOAT;1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;259;-423.6107,1275.001;Inherit;False;Property;_Color_Hue;Color_Hue;18;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;276;2424.359,-784.6206;Inherit;True;Base_Tex;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;16;1278.673,-835.3165;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;339;1265.341,3922.715;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;445;1507.413,3843.501;Inherit;False;Highlight_Alpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.VertexColorNode;195;1136.665,-557.5432;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;48;558.7561,-1026.408;Inherit;False;Property;_R_Light_Color;R_Light_Color;8;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,0;5.359224,4.402481,2.254919,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node;457;-779.8286,4101.677;Inherit;False;Property;_Vector0;Vector 0;53;0;Create;True;0;0;0;False;0;False;0,0.25,0,0.12;0.43,0.23,-0.02,0.06;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SaturateNode;411;1959.982,3315.535;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;410;1301.336,3331.778;Inherit;False;Constant;_Float0;Float 0;48;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;205;2328.514,3265.015;Inherit;True;Dissolve;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;307;1789.541,-815.6795;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;335;2130.669,-895.1095;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;263;1625.57,-584.9783;Inherit;True;261;ColorTex;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;336;1718.166,-1209.608;Inherit;True;278;Highlights;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;409;1571.297,3266.478;Inherit;True;Property;_DissolveTextureSettings1;Dissolve Texture Settings;29;0;Create;True;0;0;0;False;3;Header(Dissolve Texture Settings);Space(10);HideInInspector;False;0;0;0;True;DissolveTextureSettings;Toggle;2;Key0;Key1;Reference;271;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;460;1888.344,4341.989;Inherit;False;Constant;_Float3;Float 3;48;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;459;2324.219,4095.783;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;462;1907.371,4266.406;Inherit;False;Constant;_Float14;Float 14;49;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;461;2091.643,4250.407;Inherit;False;Property;_DissolveTextureSettings2;Dissolve Texture Settings;29;0;Create;True;0;0;0;False;3;Header(Dissolve Texture Settings);Space(10);HideInInspector;False;0;0;0;True;DissolveTextureSettings;Toggle;2;Key0;Key1;Reference;271;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;278;2562.853,4101.607;Inherit;True;Highlights;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;463;-262.2582,-755.8639;Inherit;False;Property;_BaseColor_Transition;BaseColor_Transition;5;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;40;-245.2274,-929.4295;Inherit;False;Property;_BaseTex_Smoothness;BaseTex_Smoothness;7;0;Create;True;0;0;0;False;1;Tooltip(hjwegfjwg);False;0,1;0,1;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.Vector2Node;88;-482.882,3174.871;Inherit;False;Property;_Dissolve_Smoothness;Dissolve_Smoothness;33;0;Create;True;0;0;0;False;0;False;0,1;0.27,0.02;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode;464;-250.5439,-628.7926;Inherit;False;Property;_BaseColor_Smoothness;BaseColor_Smoothness;6;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;220;-1592.501,1365.552;Inherit;False;Polar Coordinates;-1;;22;7dab8e02884cf104ebefaa2e788e4162;0;4;1;FLOAT2;0,0;False;2;FLOAT2;0.5,0.5;False;3;FLOAT;1;False;4;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;216;-1261.404,1038.612;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;469;3264,-240;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;197;-866.5705,-1941.536;Inherit;False;Property;_Src;Src;48;2;[Header];[Enum];Create;True;1;Other Settings;1;Option1;0;1;UnityEngine.Rendering.BlendMode;True;1;Space(10);False;5;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;198;-869.189,-2078.604;Inherit;False;Property;_Dst;Dst;49;1;[Enum];Create;True;0;1;Option1;0;1;UnityEngine.Rendering.BlendMode;True;0;False;10;10;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;108;-864.3116,3967.234;Inherit;False;Property;_EdgeHighlight;EdgeHighlight;38;0;Create;True;0;0;0;False;0;False;0;0.051;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1;4192,-400;Float;False;True;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;13;Uber/MasterVFX;2992e84f91cbeb14eab234972e07ea9d;True;Forward;0;1;Forward;8;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;True;True;2;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;True;True;2;5;True;_Src;10;True;_Dst;2;5;False;_Additive;10;False;_Additive;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;True;True;2;False;;True;7;True;_ZTestMode;True;True;0;False;;0;False;;True;1;LightMode=UniversalForward;False;False;0;Hidden/InternalErrorShader;0;0;Standard;23;Surface;1;0;  Blend;0;0;Two Sided;0;0;Forward Only;0;0;Cast Shadows;0;0;  Use Shadow Threshold;0;0;Receive Shadows;1;0;GPU Instancing;0;0;LOD CrossFade;0;0;Built-in Fog;0;0;DOTS Instancing;0;0;Meta Pass;0;0;Extra Pre Pass;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Vertex Position,InvertActionOnDeselection;1;0;0;10;False;True;False;True;False;False;True;True;True;False;False;;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;3;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;13;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;4;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;13;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;0;-9.187568,125.5633;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;13;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;13;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;167;2962.205,-175.5275;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;13;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;168;2962.205,-175.5275;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;13;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;SceneSelectionPass;0;6;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;169;2962.205,-175.5275;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;13;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;ScenePickingPass;0;7;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;170;2962.205,-175.5275;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;13;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;DepthNormals;0;8;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormalsOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;171;2962.205,-175.5275;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;13;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;DepthNormalsOnly;0;9;DepthNormalsOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormalsOnly;False;True;9;d3d11;metal;vulkan;xboxone;xboxseries;playstation;ps4;ps5;switch;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.RangedFloatNode;475;-880,-1808;Inherit;False;Property;_ZTestMode;ZTest Mode;50;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.CompareFunction;True;0;False;4;0;0;0;0;1;FLOAT;0
WireConnection;118;0;116;3
WireConnection;118;1;116;4
WireConnection;434;0;118;0
WireConnection;432;0;434;0
WireConnection;432;2;431;0
WireConnection;432;3;431;0
WireConnection;432;4;431;0
WireConnection;189;4;432;0
WireConnection;433;0;434;0
WireConnection;433;1;434;1
WireConnection;177;0;176;1
WireConnection;177;1;176;2
WireConnection;13;0;11;3
WireConnection;13;1;11;4
WireConnection;435;0;189;0
WireConnection;435;1;433;0
WireConnection;81;0;80;3
WireConnection;81;1;80;4
WireConnection;117;0;116;1
WireConnection;117;1;116;2
WireConnection;175;1;13;0
WireConnection;175;0;177;0
WireConnection;190;0;435;0
WireConnection;79;0;77;3
WireConnection;79;1;77;4
WireConnection;119;0;117;0
WireConnection;119;1;118;0
WireConnection;208;0;81;0
WireConnection;184;0;175;0
WireConnection;74;0;72;3
WireConnection;74;1;72;4
WireConnection;187;0;185;1
WireConnection;187;1;185;2
WireConnection;186;0;185;3
WireConnection;438;0;117;0
WireConnection;438;1;190;0
WireConnection;192;0;119;0
WireConnection;192;2;187;0
WireConnection;192;1;186;0
WireConnection;71;1;79;0
WireConnection;71;0;74;0
WireConnection;412;0;184;0
WireConnection;412;2;414;0
WireConnection;412;3;414;0
WireConnection;412;4;414;0
WireConnection;428;0;208;0
WireConnection;428;2;427;0
WireConnection;428;3;427;0
WireConnection;428;4;427;0
WireConnection;188;0;438;0
WireConnection;188;2;187;0
WireConnection;188;1;186;0
WireConnection;191;0;185;4
WireConnection;191;2;188;0
WireConnection;191;3;188;0
WireConnection;191;4;192;0
WireConnection;162;4;428;0
WireConnection;141;4;412;0
WireConnection;418;0;184;0
WireConnection;418;1;184;1
WireConnection;429;0;208;0
WireConnection;429;1;208;1
WireConnection;244;0;71;0
WireConnection;137;1;135;0
WireConnection;137;0;136;2
WireConnection;416;0;141;0
WireConnection;416;1;418;0
WireConnection;420;0;244;0
WireConnection;420;2;421;0
WireConnection;420;3;421;0
WireConnection;420;4;421;0
WireConnection;430;0;162;0
WireConnection;430;1;429;0
WireConnection;115;1;191;0
WireConnection;126;0;127;1
WireConnection;126;1;127;2
WireConnection;84;0;80;1
WireConnection;84;1;80;2
WireConnection;124;0;115;0
WireConnection;124;1;126;0
WireConnection;124;2;137;0
WireConnection;174;0;430;0
WireConnection;12;0;11;1
WireConnection;12;1;11;2
WireConnection;172;0;416;0
WireConnection;155;4;420;0
WireConnection;419;0;244;0
WireConnection;419;1;244;1
WireConnection;85;0;84;0
WireConnection;85;1;81;0
WireConnection;145;0;142;3
WireConnection;159;0;160;3
WireConnection;161;0;160;1
WireConnection;161;1;160;2
WireConnection;211;0;84;0
WireConnection;211;1;174;0
WireConnection;202;0;12;0
WireConnection;202;1;172;0
WireConnection;143;0;142;1
WireConnection;143;1;142;2
WireConnection;5;0;12;0
WireConnection;5;1;175;0
WireConnection;422;0;155;0
WireConnection;422;1;419;0
WireConnection;267;1;268;0
WireConnection;267;0;124;0
WireConnection;165;0;85;0
WireConnection;165;2;161;0
WireConnection;165;1;159;0
WireConnection;78;0;77;1
WireConnection;78;1;77;2
WireConnection;163;0;211;0
WireConnection;163;2;161;0
WireConnection;163;1;159;0
WireConnection;151;0;202;0
WireConnection;151;2;143;0
WireConnection;151;1;145;0
WireConnection;139;0;5;0
WireConnection;139;2;143;0
WireConnection;139;1;145;0
WireConnection;173;0;422;0
WireConnection;122;0;267;0
WireConnection;64;0;78;0
WireConnection;64;1;71;0
WireConnection;164;0;160;4
WireConnection;164;2;163;0
WireConnection;164;3;163;0
WireConnection;164;4;165;0
WireConnection;144;0;142;4
WireConnection;144;2;151;0
WireConnection;144;3;151;0
WireConnection;144;4;139;0
WireConnection;154;0;153;1
WireConnection;154;1;153;2
WireConnection;236;0;234;0
WireConnection;236;1;237;0
WireConnection;152;0;153;3
WireConnection;437;0;78;0
WireConnection;437;1;173;0
WireConnection;120;0;164;0
WireConnection;120;1;123;0
WireConnection;120;2;236;0
WireConnection;131;0;144;0
WireConnection;131;1;130;0
WireConnection;158;0;64;0
WireConnection;158;2;154;0
WireConnection;158;1;152;0
WireConnection;156;0;437;0
WireConnection;156;2;154;0
WireConnection;156;1;152;0
WireConnection;83;1;467;0
WireConnection;83;0;86;1
WireConnection;157;0;153;4
WireConnection;157;2;156;0
WireConnection;157;3;156;0
WireConnection;157;4;158;0
WireConnection;89;0;468;0
WireConnection;89;1;83;0
WireConnection;6;1;131;0
WireConnection;76;1;120;0
WireConnection;68;0;465;0
WireConnection;68;1;466;0
WireConnection;87;0;76;1
WireConnection;87;1;83;0
WireConnection;87;2;89;0
WireConnection;42;1;6;1
WireConnection;42;2;34;0
WireConnection;62;1;157;0
WireConnection;66;0;62;1
WireConnection;66;1;465;0
WireConnection;66;2;68;0
WireConnection;43;0;42;0
WireConnection;43;1;6;2
WireConnection;43;2;35;0
WireConnection;271;1;272;0
WireConnection;271;0;87;0
WireConnection;44;0;43;0
WireConnection;44;1;6;3
WireConnection;44;2;36;0
WireConnection;265;1;266;0
WireConnection;265;0;66;0
WireConnection;458;0;271;0
WireConnection;45;0;44;0
WireConnection;45;1;6;0
WireConnection;45;2;37;0
WireConnection;331;0;458;0
WireConnection;212;0;265;0
WireConnection;8;0;45;0
WireConnection;8;1;10;0
WireConnection;8;2;9;0
WireConnection;69;0;8;0
WireConnection;69;1;213;0
WireConnection;69;2;194;4
WireConnection;69;3;206;0
WireConnection;281;0;69;0
WireConnection;470;0;473;0
WireConnection;480;1;481;0
WireConnection;480;0;470;0
WireConnection;41;0;463;0
WireConnection;41;1;464;0
WireConnection;39;0;45;0
WireConnection;39;1;463;0
WireConnection;39;2;41;0
WireConnection;138;0;191;0
WireConnection;133;0;215;0
WireConnection;133;1;132;0
WireConnection;215;0;227;4
WireConnection;215;2;216;0
WireConnection;215;3;216;0
WireConnection;215;4;221;0
WireConnection;217;0;223;0
WireConnection;217;1;218;0
WireConnection;218;0;426;0
WireConnection;221;0;222;0
WireConnection;221;2;226;0
WireConnection;221;1;436;0
WireConnection;222;0;223;0
WireConnection;223;0;228;1
WireConnection;223;1;228;2
WireConnection;224;0;228;3
WireConnection;224;1;228;4
WireConnection;226;0;227;1
WireConnection;226;1;227;2
WireConnection;225;0;224;0
WireConnection;253;0;141;0
WireConnection;230;0;15;0
WireConnection;230;1;231;0
WireConnection;230;2;232;0
WireConnection;258;0;230;0
WireConnection;258;1;257;0
WireConnection;260;0;259;0
WireConnection;203;0;214;0
WireConnection;203;1;309;0
WireConnection;109;0;108;0
WireConnection;95;0;83;0
WireConnection;95;1;109;0
WireConnection;94;0;89;0
WireConnection;94;1;109;0
WireConnection;327;0;269;0
WireConnection;327;1;329;0
WireConnection;47;0;49;0
WireConnection;47;1;48;0
WireConnection;47;2;39;0
WireConnection;101;0;339;0
WireConnection;101;1;105;0
WireConnection;333;0;87;0
WireConnection;333;1;93;0
WireConnection;269;1;270;0
WireConnection;269;0;258;0
WireConnection;424;0;225;0
WireConnection;424;2;423;0
WireConnection;424;3;423;0
WireConnection;424;4;423;0
WireConnection;425;0;225;0
WireConnection;425;1;225;1
WireConnection;426;0;220;0
WireConnection;426;1;425;0
WireConnection;15;1;133;0
WireConnection;93;0;76;1
WireConnection;93;1;95;0
WireConnection;93;2;94;0
WireConnection;436;0;227;3
WireConnection;128;0;157;0
WireConnection;128;1;129;0
WireConnection;261;0;327;0
WireConnection;257;0;259;0
WireConnection;257;1;260;0
WireConnection;276;0;335;0
WireConnection;16;0;47;0
WireConnection;16;1;195;0
WireConnection;339;0;333;0
WireConnection;445;0;339;0
WireConnection;411;0;409;0
WireConnection;205;0;411;0
WireConnection;307;0;16;0
WireConnection;307;1;263;0
WireConnection;335;0;336;0
WireConnection;335;1;307;0
WireConnection;409;1;410;0
WireConnection;409;0;93;0
WireConnection;459;0;101;0
WireConnection;459;1;461;0
WireConnection;461;1;462;0
WireConnection;461;0;460;0
WireConnection;278;0;459;0
WireConnection;220;4;424;0
WireConnection;216;0;217;0
WireConnection;216;2;226;0
WireConnection;216;1;436;0
WireConnection;469;0;282;0
WireConnection;469;1;480;0
WireConnection;1;2;203;0
WireConnection;1;3;469;0
ASEEND*/
//CHKSM=D3A1B199A060F108C5168B2F307225F3DF7FA618