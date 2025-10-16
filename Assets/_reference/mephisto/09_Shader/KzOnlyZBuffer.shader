Shader "Kz/KzOnlyZBuffer" {
Properties {
}

SubShader {
	LOD 100
	
	Pass {
		//Tags { "LightMode"="ForwardBase" }
		Tags { "Queue" = "Geometry" "IgnoreProjector" = "True" "RenderType" = "Transparent" "PreviewType" = "Plane" }
		Blend SrcAlpha OneMinusSrcAlpha 
		ZWrite On
		CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			
			#include "UnityCG.cginc"

			struct appdata_t {
				float4 vertex : POSITION;
			};

			struct v2f {
				float4 vertex : SV_POSITION;
				float2 texcoord : TEXCOORD0;
			};

			fixed4 _Color;
			float _SpeedU, _SpeedV;
			
			v2f vert (appdata_t v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				return o;
			}
			
			fixed4 frag (v2f i) : SV_Target
			{
				fixed4 col = fixed4(0, 0, 0, 0);
				return col;
			}
		ENDCG
	}
}

}
