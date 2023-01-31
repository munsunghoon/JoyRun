// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.3391544,fgcg:0.7640719,fgcb:0.9044118,fgca:0,fgde:0.0025,fgrn:700,fgrf:1500,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:True,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33764,y:32591,varname:node_9361,prsc:2|emission-2441-RGB,custl-2441-RGB,alpha-2441-A;n:type:ShaderForge.SFN_Vector4Property,id:6479,x:31376,y:32434,ptovrint:False,ptlb:sheet,ptin:_sheet,varname:node_6479,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:4,v2:4,v3:1,v4:0;n:type:ShaderForge.SFN_Tex2d,id:2441,x:33552,y:32691,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_2441,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-4202-OUT;n:type:ShaderForge.SFN_Add,id:4202,x:33378,y:32691,varname:node_4202,prsc:2|A-3569-OUT,B-8803-OUT;n:type:ShaderForge.SFN_Divide,id:3569,x:33204,y:32691,varname:node_3569,prsc:2|A-9272-UVOUT,B-235-OUT;n:type:ShaderForge.SFN_TexCoord,id:9272,x:33012,y:32542,varname:node_9272,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Append,id:8803,x:33204,y:32877,varname:node_8803,prsc:2|A-2676-OUT,B-9502-OUT;n:type:ShaderForge.SFN_Divide,id:2676,x:33012,y:32877,varname:node_2676,prsc:2|A-6195-OUT,B-7525-OUT;n:type:ShaderForge.SFN_Fmod,id:6195,x:32827,y:32782,varname:node_6195,prsc:2|A-6657-OUT,B-5561-OUT;n:type:ShaderForge.SFN_Append,id:235,x:33012,y:32711,varname:node_235,prsc:2|A-3086-OUT,B-524-OUT;n:type:ShaderForge.SFN_OneMinus,id:9502,x:33012,y:33025,varname:node_9502,prsc:2|IN-1972-OUT;n:type:ShaderForge.SFN_Divide,id:1972,x:32827,y:33025,varname:node_1972,prsc:2|A-4138-OUT,B-1819-OUT;n:type:ShaderForge.SFN_Floor,id:4138,x:32609,y:33025,varname:node_4138,prsc:2|IN-4560-OUT;n:type:ShaderForge.SFN_Divide,id:4560,x:32436,y:33025,varname:node_4560,prsc:2|A-8998-OUT,B-598-OUT;n:type:ShaderForge.SFN_Round,id:8998,x:32213,y:32546,varname:node_8998,prsc:2|IN-509-OUT;n:type:ShaderForge.SFN_Multiply,id:509,x:32021,y:32546,varname:node_509,prsc:2|A-177-OUT,B-7492-OUT;n:type:ShaderForge.SFN_Multiply,id:177,x:31828,y:32546,varname:node_177,prsc:2|A-7404-OUT,B-524-OUT;n:type:ShaderForge.SFN_Frac,id:7492,x:31828,y:32808,varname:node_7492,prsc:2|IN-7991-OUT;n:type:ShaderForge.SFN_Multiply,id:7991,x:31581,y:32808,varname:node_7991,prsc:2|A-6479-Z,B-4910-T;n:type:ShaderForge.SFN_Time,id:4910,x:31374,y:32808,varname:node_4910,prsc:2;n:type:ShaderForge.SFN_Relay,id:1819,x:32519,y:33330,varname:node_1819,prsc:2|IN-6926-OUT;n:type:ShaderForge.SFN_Relay,id:5561,x:32242,y:32453,varname:node_5561,prsc:2|IN-7404-OUT;n:type:ShaderForge.SFN_Relay,id:7404,x:31629,y:32453,varname:node_7404,prsc:2|IN-6479-X;n:type:ShaderForge.SFN_Relay,id:524,x:31629,y:32733,varname:node_524,prsc:2|IN-6479-Y;n:type:ShaderForge.SFN_Relay,id:6926,x:31856,y:33331,varname:node_6926,prsc:2|IN-524-OUT;n:type:ShaderForge.SFN_Relay,id:7525,x:32639,y:32900,varname:node_7525,prsc:2|IN-5561-OUT;n:type:ShaderForge.SFN_Relay,id:598,x:31857,y:33048,varname:node_598,prsc:2|IN-7404-OUT;n:type:ShaderForge.SFN_Relay,id:6657,x:32621,y:32545,varname:node_6657,prsc:2|IN-8998-OUT;n:type:ShaderForge.SFN_Relay,id:3086,x:32856,y:32448,varname:node_3086,prsc:2|IN-5561-OUT;proporder:2441-6479;pass:END;sub:END;*/

Shader "BGShader/BG_sprite_sheet" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _sheet ("sheet", Vector) = (4,4,1,0)
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
            Cull Off
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
            uniform float4 _sheet;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                UNITY_FOG_COORDS(1)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
////// Lighting:
////// Emissive:
                float node_7404 = _sheet.r;
                float node_5561 = node_7404;
                float node_524 = _sheet.g;
                float4 node_4910 = _Time;
                float node_8998 = round(((node_7404*node_524)*frac((_sheet.b*node_4910.g))));
                float2 node_4202 = ((i.uv0/float2(node_5561,node_524))+float2((fmod(node_8998,node_5561)/node_5561),(1.0 - (floor((node_8998/node_7404))/node_524))));
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(node_4202, _MainTex));
                float3 emissive = _MainTex_var.rgb;
                float3 finalColor = emissive + _MainTex_var.rgb;
                fixed4 finalRGBA = fixed4(finalColor,_MainTex_var.a);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            Cull Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal n3ds wiiu 
            #pragma target 2.0
            struct VertexInput {
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
