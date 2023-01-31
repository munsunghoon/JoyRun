// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.3391544,fgcg:0.7640719,fgcb:0.9044118,fgca:0,fgde:0.0025,fgrn:700,fgrf:1500,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:True,fnsp:True,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:32731,y:32734,varname:node_4013,prsc:2|custl-9815-OUT,alpha-7471-OUT;n:type:ShaderForge.SFN_Color,id:1304,x:32194,y:32754,ptovrint:False,ptlb:Color,ptin:_Color,varname:_Color,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2d,id:6443,x:31650,y:32753,ptovrint:False,ptlb:DistortionMap,ptin:_DistortionMap,varname:_DistortionMap,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-4376-OUT;n:type:ShaderForge.SFN_Cubemap,id:5493,x:32005,y:32559,ptovrint:False,ptlb:CubeMap,ptin:_CubeMap,varname:_CubeMap,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,pvfc:0|DIR-3808-OUT;n:type:ShaderForge.SFN_ViewReflectionVector,id:4066,x:31470,y:32559,varname:node_4066,prsc:2;n:type:ShaderForge.SFN_Lerp,id:6673,x:32194,y:32559,varname:node_6673,prsc:2|A-5493-RGB,B-9526-OUT,T-5493-RGB;n:type:ShaderForge.SFN_Add,id:4636,x:32384,y:32734,varname:node_4636,prsc:2|A-6673-OUT,B-1304-RGB;n:type:ShaderForge.SFN_Multiply,id:3808,x:31830,y:32559,varname:node_3808,prsc:2|A-7737-OUT,B-6443-RGB;n:type:ShaderForge.SFN_TexCoord,id:5468,x:30928,y:32557,varname:node_5468,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_VertexColor,id:473,x:32194,y:32935,varname:node_473,prsc:2;n:type:ShaderForge.SFN_Multiply,id:7471,x:32557,y:32993,varname:node_7471,prsc:2|A-1304-A,B-473-A;n:type:ShaderForge.SFN_ConstantLerp,id:7737,x:31650,y:32559,varname:node_7737,prsc:2,a:-1,b:2|IN-4066-OUT;n:type:ShaderForge.SFN_ConstantLerp,id:9815,x:32557,y:32734,varname:node_9815,prsc:2,a:0,b:2|IN-4636-OUT;n:type:ShaderForge.SFN_Vector1,id:9526,x:32005,y:32733,varname:node_9526,prsc:2,v1:0;n:type:ShaderForge.SFN_Tex2d,id:7969,x:31271,y:32753,ptovrint:False,ptlb:noise,ptin:_noise,varname:node_664,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-1909-UVOUT;n:type:ShaderForge.SFN_Slider,id:3666,x:31114,y:32966,ptovrint:False,ptlb:node_5551,ptin:_node_5551,varname:node_5551,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Lerp,id:4376,x:31470,y:32753,varname:node_4376,prsc:2|A-8908-OUT,B-7969-R,T-3666-OUT;n:type:ShaderForge.SFN_Panner,id:1909,x:31114,y:32753,varname:node_1909,prsc:2,spu:0,spv:0.001|UVIN-5468-UVOUT;n:type:ShaderForge.SFN_Relay,id:8908,x:31311,y:32555,varname:node_8908,prsc:2|IN-5468-UVOUT;proporder:1304-6443-5493-7969-3666;pass:END;sub:END;*/

Shader "BGShader/BG_Water_city_med" {
    Properties {
        _Color ("Color", Color) = (1,1,1,1)
        _DistortionMap ("DistortionMap", 2D) = "white" {}
        _CubeMap ("CubeMap", Cube) = "_Skybox" {}
        _noise ("noise", 2D) = "white" {}
        _node_5551 ("node_5551", Range(0, 1)) = 0
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal n3ds wiiu 
            #pragma target 2.0
            uniform float4 _Color;
            uniform sampler2D _DistortionMap; uniform float4 _DistortionMap_ST;
            uniform samplerCUBE _CubeMap;
            uniform sampler2D _noise; uniform float4 _noise_ST;
            uniform float _node_5551;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float4 vertexColor : COLOR;
                UNITY_FOG_COORDS(3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
////// Lighting:
                float4 node_4389 = _Time;
                float2 node_1909 = (i.uv0+node_4389.g*float2(0,0.001));
                float4 _noise_var = tex2D(_noise,TRANSFORM_TEX(node_1909, _noise));
                float2 node_4376 = lerp(i.uv0,float2(_noise_var.r,_noise_var.r),_node_5551);
                float4 _DistortionMap_var = tex2D(_DistortionMap,TRANSFORM_TEX(node_4376, _DistortionMap));
                float4 _CubeMap_var = texCUBE(_CubeMap,(lerp(-1,2,viewReflectDirection)*_DistortionMap_var.rgb));
                float node_9526 = 0.0;
                float3 finalColor = lerp(0,2,(lerp(_CubeMap_var.rgb,float3(node_9526,node_9526,node_9526),_CubeMap_var.rgb)+_Color.rgb));
                fixed4 finalRGBA = fixed4(finalColor,(_Color.a*i.vertexColor.a));
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
