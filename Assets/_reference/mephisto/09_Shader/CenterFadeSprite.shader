Shader"Custom/CenterFadeUnlitURP"
{
    Properties
    {
        _MainTex ("Sprite Texture", 2D) = "white" {}
        _FadeRadius ("Fade Radius", Range(0, 1)) = 0.5
    }

    SubShader
    {
        Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Transparent" "Queue"="Transparent" }

        Pass
        {
Name"Sprite"
            Blend
SrcAlpha OneMinusSrcAlpha

            HLSLINCLUDE

#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"

struct appdata
{
    float4 vertex : POSITION;
    float2 uv : TEXCOORD0;
};

struct v2f
{
    float2 uv : TEXCOORD0;
    float4 vertex : SV_POSITION;
    float2 centerDist : TEXCOORD1;
};

sampler2D _MainTex;
float _FadeRadius;

v2f vert(appdata v)
{
    v2f o;
    o.vertex = Unity_ProjectionMatrix * Unity_ObjectToWorldMatrix * v.vertex;
    o.uv = v.uv;

                // Calculate distance from center (0.5, 0.5 in UV space is the center)
    o.centerDist = abs(o.uv - float2(0.5, 0.5));

    return o;
}

half4 frag(v2f i) : SV_Target
{
                // Fetch the sprite texture
    half4 col = tex2D(_MainTex, i.uv);

                // Calculate fade based on distance from center
    half dist = length(i.centerDist * 2); // multiply by 2 because uv space is 0 to 1
    half alphaFade = smoothstep(_FadeRadius, 1, dist);

                // Multiply texture alpha by our calculated fade
    col.a *= alphaFade;

    return col;
}

            ENDHLSL
        }
    }
}
