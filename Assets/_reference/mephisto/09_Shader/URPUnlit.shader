 Shader"Custom/URPUnlit"
{
    // The _BaseMap variable is visible in the Material's Inspector, as a field
    // called Base Map.
    Properties
    { 
        _MainTex ("Main Texture", 2D) = "white" {}	//0
        _Color("Main Color", Color) = (1,1,1,1)		//1
        _FadeRadius ("Fade Radius", Range(0, 1)) = 0.5
    }

    SubShader
    {
        Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Transparent" "Queue"="Transparent" }

        Pass
        {
            Blend SrcAlpha OneMinusSrcAlpha

            HLSLPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"            

            struct Attributes
            {
                float4 positionOS : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct Varyings
            {
                float4 positionHCS : SV_POSITION;
                float2 uv : TEXCOORD0;
                float2 centerDist : TEXCOORD1;
            };

            TEXTURE2D(_MainTex);
            SAMPLER(sampler_MainTex);

            CBUFFER_START(UnityPerMaterial)
                float4 _MainTex_ST;
                half4 _Color;
                float _FadeRadius;
            CBUFFER_END

            Varyings vert(Attributes IN)
            {
                Varyings OUT;
                OUT.positionHCS = TransformObjectToHClip(IN.positionOS.xyz);
                OUT.uv = IN.uv; //TRANSFORM_TEX(IN.uv, _MainTex);
                //OUT.centerDist = abs(OUT.uv - float2(0.5, 0.5));
                OUT.centerDist = OUT.uv - float2(0.5, 0.5);
                return OUT;
            }

            half4 frag(Varyings IN) : SV_Target
            {
    
                //half dist = length(IN.centerDist * 2); // multiply by 2 because uv space is 0 to 1
                //half dist = IN.centerDist * 2; // multiply by 2 because uv space is 0 to 1
                //return half4(dist, 0, 0, 1);
    
                half4 color = SAMPLE_TEXTURE2D(_MainTex, sampler_MainTex, IN.uv);
                color *= _Color;
    
                half dist = length(IN.centerDist * 2);
                //half alphaFade = smoothstep(_FadeRadius, 1, dist);
                //half alphaFade = smoothstep(1, _FadeRadius, dist);
                //color.a *= alphaFade;
                if (dist > _FadeRadius)
                {
                    color.a = 0;
                }
    
                return color;
            }
            ENDHLSL
        }
    }
}