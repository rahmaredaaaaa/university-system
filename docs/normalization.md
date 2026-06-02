# 📊 **Database Normalization – University System**

---

## 📌 **System Overview**
The University Database System was designed to ensure **clean structure, no redundancy, and strong data consistency**.  
Normalization was applied up to **Third Normal Form (3NF)**.

---

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

## 🟢 **First Normal Form (1NF) – Atomic Values Check**

### 📍 **Rule**
All attributes must contain a single atomic value (no lists or repeating groups).

---

### 📌 **Application**
All tables were reviewed to ensure that each column stores only one value.

❌ Example of issue found:
Student phone numbers were stored like:

010123, 011456

---

### 🛠️ **Solution**
A separate table was created:

STUDENT_PHONE(Student_ID, Phone_Number)

---

### ✅ **Result**
✔ No multi-valued attributes  
✔ Each field contains a single value  
✔ 1NF is satisfied  

---

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

## 🟡 **Second Normal Form (2NF) – Composite Key Check**

### 📍 **Rule**
All non-key attributes must depend on the full composite key.

---

### 📌 **Application**
Composite-key relations were analyzed:

- STUDENT_JOIN (Club_ID, Student_ID)  
- ENROLL (Course_ID, Student_ID)  
- STUDENT_PHONE (Student_ID, Phone_Number)  
- GRADUATION_PROJECT (GP_ID, Student_ID)  
- RESEARCH_PROJECT (RP_ID, Department_ID)  
- BORROW (Student_ID, Book_ID)

---

### 🛠️ **Validation**
Each attribute (if exists) depends on the full key, not part of it.

---

### ✅ **Result**
✔ No partial dependency  
✔ Composite keys are valid  
✔ 2NF is satisfied  

---

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

## 🔵 **Third Normal Form (3NF) – Dependency Check**

### 📍 **Rule**
No non-key attribute should depend on another non-key attribute.

---

### 📌 **Application**
Each entity was validated:

- STUDENT → depends only on Student_ID  
- PROFESSOR → depends only on Professor_ID  
- DEPARTMENT → depends only on Department_ID  
- COURSE → depends only on Course_ID  
- BOOK → depends only on Book_ID  

Relationship tables contain only foreign keys.

---

### ✨ **Result**
✔ No transitive dependency  
✔ Clean separation of entities  
✔ 3NF is satisfied  

---

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

## 🎯 **Final Result**

✔ 1NF → Atomic values ensured  
✔ 2NF → No partial dependency  
✔ 3NF → No transitive dependency  

---

## 💡 **Final Outcome**
The database is:

✔ Clean  
✔ Structured  
✔ Scalable  
✔ Fully normalized  