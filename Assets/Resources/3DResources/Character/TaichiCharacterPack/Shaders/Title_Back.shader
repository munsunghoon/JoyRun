// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33764,y:32591,varname:node_9361,prsc:2|diff-851-RGB,custl-851-RGB;n:type:ShaderForge.SFN_Tex2d,id:851,x:33127,y:32824,ptovrint:False,ptlb:Diffuse,ptin:_MainTex,varname:node_851,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-6481-OUT;n:type:ShaderForge.SFN_Lerp,id:6481,x:32904,y:32824,varname:node_6481,prsc:2|A-5091-UVOUT,B-50-R,T-4494-OUT;n:type:ShaderForge.SFN_Panner,id:2316,x:32408,y:32873,varname:node_2316,prsc:2,spu:0,spv:-1|UVIN-5091-UVOUT,DIST-8421-TSL;n:type:ShaderForge.SFN_Tex2d,id:50,x:32603,y:32873,ptovrint:False,ptlb:noise,ptin:_noise,varname:_MainTex_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-2316-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:5091,x:32201,y:32643,varname:node_5091,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Slider,id:4494,x:32661,y:33098,ptovrint:False,ptlb:power,ptin:_power,varname:node_4494,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Time,id:8421,x:32077,y:32886,varname:node_8421,prsc:2;proporder:851-50-4494;pass:END;sub:END;*/

Shader "BGShader/BG_Title_Back" {
    Properties {
        _MainTex ("Diffuse", 2D) = "white" {}
        _noise ("noise", 2D) = "white" {}
        _power ("power", Range(0, 1)) = 0
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal n3ds wiiu 
            #pragma target 3.0
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform sampler2D _noise; uniform float4 _noise_ST;
            uniform float _power;
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
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
                float4 node_8421 = _Time;
                float2 node_2316 = (i.uv0+node_8421.r*float2(0,-1));
                float4 _noise_var = tex2D(_noise,TRANSFORM_TEX(node_2316, _noise));
                float2 node_6481 = lerp(i.uv0,float2(_noise_var.r,_noise_var.r),_power);
                float4 _Diffuse_var = tex2D(_MainTex,TRANSFORM_TEX(node_6481, _MainTex));
                float3 finalColor = _Diffuse_var.rgb;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
