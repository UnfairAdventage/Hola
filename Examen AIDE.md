# Simulación de Examen del Segundo Parcial
## Temas Selectos de Matemáticas I

### 1. Derivadas
Resuelve las siguientes derivadas:

1. **\(f(x)=\arcot(4x^3+6x)\)**

   \[
   f'(x)=-\frac{12x^2+6}{1+(4x^3+6x)^2}
   \]

2. **\(g(x)=e^{4x^7+4x-2}\)**

   \[
   g'(x)=e^{4x^7+4x-2}(28x^6+4)
   \]

3. **\(p(x)=\sqrt{\frac{8x-2}{x^2+2}}\)**

   Sea \(u(x)=\frac{8x-2}{x^2+2}\), entonces:
   \[
   p'(x)=\frac{-8x^2+4x+16}{2(x^2+2)^{2}\sqrt{\tfrac{8x-2}{x^2+2}}}
   \]

4. **\(w(x)=4(3x^7-\sen x)^3\)**

   \[
   w'(x)=12(3x^7-\sen x)^2(21x^6-\cos x)
   \]

5. **\(h(x)=\sqrt{5\,(x^4+2)^3}\)**

   \[
   h'(x)=\frac{30x^3\,(x^4+2)^{2}}{\sqrt{5\,(x^4+2)^3}}
   \]

6. **\(j(x)=\sec(x^5-2x+4)\)**

   \[
   j'(x)=\sec(x^5-2x+4)\tan(x^5-2x+4)(5x^4-2)
   \]

7. **\(z(x)=\ln\bigl(\sen x/4\bigr)\)**

   \[
   z'(x)=\cot x
   \]

8. **\(m(x)=(4x^7+5x)^{\sen x}\)**

   Usando log-diferenciación:
   \[
   m'(x)=m(x)\Bigl[\cos x\ln(4x^7+5x)+\sin x\frac{28x^6+5}{4x^7+5x}\Bigr].
   \]

---

### 2. Perímetros de polígonos
Calcula el perímetro de los polígonos formados al unir los puntos en el orden dado.

1. **A(4,5) → B(-2,3) → C(1,-4) → D(4,-4) → A**
   - \(AB=2\sqrt{10}\)
   - \(BC=\sqrt{58}\)
   - \(CD=3\)
   - \(DA=9\)

   **Perímetro:**
   \[
   P_1=2\sqrt{10}+\sqrt{58}+3+9
   \]

2. **A(1,5) → B(-2,5) → C(-3,-3) → D(1,-1) → A**
   - \(AB=3\)
   - \(BC=\sqrt{65}\)
   - \(CD=2\sqrt{5}\)
   - \(DA=6\)

   **Perímetro:**
   \[
   P_2=3+\sqrt{65}+2\sqrt{5}+6
   \]

3. **A(3,4) → B(-1,3) → C(-3,-2) → D(3,-2) → A**
   - \(AB=\sqrt{17}\)
   - \(BC=\sqrt{29}\)
   - \(CD=6\)
   - \(DA=6\)

   **Perímetro:**
   \[
   P_3=\sqrt{17}+\sqrt{29}+12
   \]

---

### 3. Caminos en geometría del taxista
Número de caminos posibles moviéndose solo en ejes horizontal y vertical.

1. De **(2,5)** a **(-1,-2)**:
   - Pasos al oeste: 3, pasos al sur: 7, total 10 pasos.
   \[
   N_1=\binom{10}{3}=120
   \]

2. De **(1,4)** a **(-3,-2)**:
   - Pasos al oeste: 4, pasos al sur: 6, total 10 pasos.
   \[
   N_2=\binom{10}{4}=210
   \]

---

### 4. Propiedades de los logaritmos

- \(\log_b(xy)=\log_b x+\log_b y\)
- \(\log_b(\tfrac{x}{y})=\log_b x-\log_b y\)
- \(\log_b(x^k)=k\log_b x\)
- \(\log_{b_2}x=\frac{\log_{b_1}x}{\log_{b_1}b_2}\)

---

### 5. Leyes de senos y cosenos

#### 5.1 Triángulo euclidiano
- **Ley de senos:** \(\tfrac{a}{\sin A}=\tfrac{b}{\sin B}=\tfrac{c}{\sin C}\)
- **Ley de cosenos:** \(c^2=a^2+b^2-2ab\cos C\)

#### 5.2 Triángulo esférico (radio unitario)
- **Ley de senos esférica:** \(\tfrac{\sin A}{\sin a}=\tfrac{\sin B}{\sin b}=\tfrac{\sin C}{\sin c}\)
- **Ley de cosenos (lados):** \(\cos a=\cos b\cos c+\sin b\sin c\cos A\)
- **Ley de cosenos (ángulos):** \(\cos A=-\cos B\cos C+\sin B\sin C\cos a\)

---

### 6. Propiedades de radicales y exponentes

#### Exponentes
1. \(a^m a^n=a^{m+n}\)
2. \(\tfrac{a^m}{a^n}=a^{m-n}\)
3. \((a^m)^n=a^{mn}\)
4. \((ab)^n=a^n b^n\)
5. \((\tfrac{a}{b})^n=\tfrac{a^n}{b^n}\)

#### Radicales
1. \(\sqrt[n]{ab}=\sqrt[n]a\sqrt[n]b\)
2. \(\sqrt[n]{\tfrac{a}{b}}=\tfrac{\sqrt[n]a}{\sqrt[n]b}\)
3. \((\sqrt[n]a)^m=\sqrt[n]{a^m}=a^{m/n}\)
4. Extracción de factores perfectos.

---

### 7. Fractales y Salud

#### 7.1 ¿Qué es un fractal?
Un fractal es un conjunto geométrico con auto-similitud y dimensión fractal (no entera).

#### 7.2 Propiedades de un fractal natural
- Auto-similitud estadística
- Irregularidad a todas las escalas
- Dimensión fractal
- Generación iterativa

#### 7.3 Aplicaciones en el cuerpo humano y la salud
- Ramificación fractal en bronquios
- Escalado fractal en vasos sanguíneos
- Análisis fractal de ECG
- Detección de tumores en imágenes médicas

