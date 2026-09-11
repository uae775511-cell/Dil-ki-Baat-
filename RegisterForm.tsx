 "use client";
import {useState} from "react";
export default function RegisterForm(){
 const [phone,setPhone]=useState(""); const [code,setCode]=useState(""); const [sent,setSent]=useState(false); const [msg,setMsg]=useState("");
 async function send(e:any){e.preventDefault();setMsg("");const r=await fetch("/api/auth/send-otp",{method:"POST",headers:{"content-type":"application/json"},body:JSON.stringify({phone})});const d=await r.json();if(!r.ok)setMsg(d.error||"OTP send failed");else{setSent(true);setMsg("OTP sent. Check your phone.");}}
 async function verify(e:any){e.preventDefault();setMsg("");const r=await fetch("/api/auth/verify-otp",{method:"POST",headers:{"content-type":"application/json"},body:JSON.stringify({phone,code})});const d=await r.json();if(!r.ok)setMsg(d.error||"Verification failed");else setMsg("Phone verified. Account/profile creation can continue from here.");}
 return <form>{!sent?<><label>Phone number</label><input className="input" placeholder="+491701234567" value={phone} onChange={e=>setPhone(e.target.value)} required/><button className="btn" onClick={send}>Send OTP</button></>:<><label>OTP code</label><input className="input" inputMode="numeric" maxLength={6} value={code} onChange={e=>setCode(e.target.value)} placeholder="123456" required/><button className="btn" onClick={verify}>Verify OTP</button></>}<p className={msg.startsWith("OTP sent")||msg.startsWith("Phone verified")?"success":"error"}>{msg}</p></form>
}
