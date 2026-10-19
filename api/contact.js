export default async function handler(req, res) {
  if (req.method !== 'POST') return res.status(405).json({error:'Method not allowed'});
  const {name,email,phone,subject,message,website,consent} = req.body || {};
  if (website) return res.status(200).json({ok:true});
  const valid = typeof name==='string' && name.trim().length>=2 && name.length<=120 && typeof email==='string' && /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email) && email.length<=180 && typeof message==='string' && message.trim().length>=10 && message.length<=5000 && typeof subject==='string' && subject.length<=120 && consent==='yes';
  if (!valid) return res.status(400).json({error:'Please complete the required fields correctly.'});
  if (!process.env.RESEND_API_KEY || !process.env.CONTACT_FROM_EMAIL) return res.status(503).json({error:'Email delivery is being configured. Please email roseanngathonik@gmail.com directly.'});
  const safe = value => String(value||'').replace(/[<>]/g,'').slice(0,5500);
  const response = await fetch('https://api.resend.com/emails', {method:'POST', headers:{Authorization:`Bearer ${process.env.RESEND_API_KEY}`,'Content-Type':'application/json'},body:JSON.stringify({from:process.env.CONTACT_FROM_EMAIL,to:['roseanngathonik@gmail.com'],reply_to:email,subject:`Website enquiry: ${safe(subject)}`,text:`Name: ${safe(name)}\nEmail: ${safe(email)}\nPhone: ${safe(phone)}\nSubject: ${safe(subject)}\n\n${safe(message)}`})});
  if (!response.ok) return res.status(502).json({error:'We could not deliver the enquiry right now. Please use the email link instead.'});
  return res.status(200).json({ok:true});
}
