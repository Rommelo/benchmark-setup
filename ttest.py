 from scipy.stats import ttest_ind_from_stats


# Gruppe 1

mean1 = 26.788   # Mittelwert

std1 = 1.066     # Standardabweichung

n1 = 10         # Anzahl der Messungen (Stichprobengröße)


# Gruppe 2

mean2 = 27.595   # Mittelwert

std2 = 0.524   # Standardabweichung

n2 = 10         # Anzahl der Messungen (Stichprobengröße)


# --- BERECHNUNG ---

# equal_var=False aktiviert den Welch-Test (für ungleiche Varianzen)

t_stat, p_val = ttest_ind_from_stats(

    mean1, std1, n1,

    mean2, std2, n2,

    equal_var=False

)


# --- AUSGABE ---

print(f"t-Wert: {t_stat:.4f}")

print(f"p-Wert: {p_val:.4f}")


# Entscheidungshilfe

alpha = 0.05

if p_val < alpha:

    print("✅ Ergebnis: Signifikanter Unterschied (p < 0.05)")

else:

    print("❌ Ergebnis: Kein signifikanter Unterschied (p >= 0.05)") 
