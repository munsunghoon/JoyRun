// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.4926471,fgcg:0.7613986,fgcb:1,fgca:0,fgde:0.01,fgrn:63,fgrf:78,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:True,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33867,y:32622,varname:node_9361,prsc:2|emission-2256-OUT,custl-6144-OUT;n:type:ShaderForge.SFN_Tex2d,id:851,x:32966,y:33034,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_851,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:2644,x:32772,y:32868,ptovrint:False,ptlb:LightMap,ptin:_LightMap,varname:node_9622,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:1,isnm:False|UVIN-4599-UVOUT;n:type:ShaderForge.SFN_Lerp,id:9981,x:32966,y:32868,varname:node_9981,prsc:2|A-2644-RGB,B-607-OUT,T-2644-RGB;n:type:ShaderForge.SFN_ValueProperty,id:607,x:32772,y:32780,ptovrint:False,ptlb:LightMap_Pow,ptin:_LightMap_Pow,varname:node_1949,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1.7;n:type:ShaderForge.SFN_TexCoord,id:4599,x:32587,y:32868,varname:node_4599,prsc:2,uv:1,uaff:False;n:type:ShaderForge.SFN_Multiply,id:6144,x:33150,y:32868,varname:node_6144,prsc:2|A-9981-OUT,B-851-RGB;n:type:ShaderForge.SFN_Tex2d,id:2810,x:33335,y:32723,ptovrint:False,ptlb:emission,ptin:_emission,varname:_Diffuse_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Lerp,id:2256,x:33646,y:32723,varname:node_2256,prsc:2|A-2810-RGB,B-8388-OUT,T-2810-RGB;n:type:ShaderForge.SFN_Time,id:7125,x:32766,y:32531,varname:node_7125,prsc:2;n:type:ShaderForge.SFN_Multiply,id:2819,x:32958,y:32531,varname:node_2819,prsc:2|A-7599-OUT,B-7125-T;n:type:ShaderForge.SFN_ValueProperty,id:7599,x:32766,y:32461,ptovrint:False,ptlb:emission speed,ptin:_emissionspeed,varname:node_7599,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Sin,id:1574,x:33148,y:32531,varname:node_1574,prsc:2|IN-2819-OUT;n:type:ShaderForge.SFN_RemapRange,id:8388,x:33335,y:32531,varname:node_8388,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-1574-OUT;proporder:607-2644-851-2810-7599;pass:END;sub:END;*/

Shader "BGShader/BG_Blinn_Emission_unLit" {
    Properties {
        _LightMap_Pow ("LightMap_Pow", Float ) = 1.7
        _LightMap ("LightMap", 2D) = "gray" {}
        _MainTex ("MainTex", 2D) = "white" {}
        _emission ("emission", 2D) = "white" {}
        _emissionspeed ("emission speed", Float ) = 1
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
            #pragma target 2.0
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform sampler2D _LightMap; uniform float4 _LightMap_ST;
            uniform float _LightMap_Pow;
            uniform sampler2D _emission; uniform float4 _emission_ST;
            uniform float _emissionspeed;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                UNITY_FOG_COORDS(2)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
////// Emissive:
                float4 _emission_var = tex2D(_emission,TRANSFORM_TEX(i.uv0, _emission));
                float4 node_7125 = _Time;
                float node_8388 = (sin((_emissionspeed*node_7125.g))*0.5+0.5);
                float3 emissive = lerp(_emission_var.rgb,float3(node_8388,node_8388,node_8388),_emission_var.rgb);
                float4 _LightMap_var = tex2D(_LightMap,TRANSFORM_TEX(i.uv1, _LightMap));
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float3 finalColor = emissive + (lerp(_LightMap_var.rgb,float3(_LightMap_Pow,_LightMap_Pow,_LightMap_Pow),_LightMap_var.rgb)*_MainTex_var.rgb);
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
