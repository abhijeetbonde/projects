def format_name(f_name, l_name):
    first_name = f_name.title()
    last_name = l_name.title()
    return f"{f_name.title()} {last_name.title()}"

print(format_name("RaM", "RAjA"))
