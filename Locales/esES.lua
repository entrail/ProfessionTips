local ADDON_NAME, ns = ...
-- Shared by esES (Spain) and esMX (Latin America): the official game
-- translations differ only in a handful of terms, none of which appear
-- in these strings.
local locale = GetLocale()
if locale ~= "esES" and locale ~= "esMX" then return end
local L = ns.L

L["%s only"] = "Solo %s"
L["0 (professions only)"] = "0 (solo profesiones)"
L["About"] = "Acerca de"
L["Adds this profession's recipes an item is used in to its tooltip, with the skill range that still gives points and whether you know the recipe."] = "Añade a la descripción de un objeto las recetas de esta profesión en las que se usa, con el rango de habilidad que aún da puntos y si conoces la receta."
L["Also annotates reagents of professions this character does not have (as if at skill 0) - useful to decide what to keep or send to alts."] = "Anota también los componentes de profesiones que este personaje no tiene (como con habilidad 0): útil para decidir qué conservar o enviar a otros personajes."
L["Always show"] = "Mostrar siempre"
L["Author: %s"] = "Autor: %s"
L["Could not open the settings window on this client. Find the options under Game Menu -> Options -> AddOns -> ProfessionTips."] = "No se pudo abrir la ventana de ajustes en este cliente. Encontrarás las opciones en Menú del juego -> Opciones -> AddOns -> ProfessionTips."
L["Display"] = "Visualización"
L["Include processed materials"] = "Incluir materiales procesados"
L["List only recipes this character has already learned. Unlearned recipes still count for the header's accumulated skill range and the '+N more' summary."] = "Mostrar solo las recetas que este personaje ya ha aprendido. Las recetas no aprendidas siguen contando para el rango de habilidad de la cabecera y el resumen '+N más'."
L["more recipes give points"] = "recetas más dan puntos"
L["no skillups"] = "ya no da puntos"
L["not learned"] = "no aprendida"
L["Only add the tooltip information while this modifier key is held down."] = "Añadir la información a la descripción solo mientras se mantiene pulsada esta tecla modificadora."
L["Only learned recipes"] = "Solo recetas aprendidas"
L["processed material"] = "material procesado"
L["Professions"] = "Profesiones"
L["Raw materials also show the recipes of what they are processed into (cloth into bolts, ore into bars, hides into cured hides, ...), marked with 'via'."] = "Las materias primas muestran también las recetas de aquello en lo que se transforman (tela en rollos, mineral en lingotes, pieles en pieles curadas, ...), marcadas con 'vía'."
L["Recipe lines per profession section. 0 shows only the profession headers with their accumulated skill range; otherwise at least 2 (the lowest- and highest-requirement recipes always appear together). More recipes are summarized as '+N more'."] = "Líneas de recetas por sección de profesión. 0 muestra solo las cabeceras de profesión con su rango de habilidad acumulado; si no, al menos 2 (las recetas de requisito más bajo y más alto siempre aparecen juntas). Las demás recetas se resumen como '+N más'."
L["Recipes listed per profession"] = "Recetas listadas por profesión"
L["Show for missing professions"] = "Mostrar para profesiones que no tienes"
L["Show only while holding"] = "Mostrar solo al mantener pulsada"
L["Version: %s"] = "Versión: %s"
L["via %s"] = "vía %s"
