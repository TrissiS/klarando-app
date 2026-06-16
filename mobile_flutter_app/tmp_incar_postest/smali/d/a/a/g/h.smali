.class public final synthetic Ld/a/a/g/h;
.super Ljava/lang/Object;
.source "KeyboardAction.java"


# direct methods
.method public static a(Ld/a/a/g/i;Landroid/view/View;)V
    .registers 4
    .param p0, "_this"    # Ld/a/a/g/i;

    if-nez p1, :cond_3

    return-void

    .line 1
    :cond_3
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "input_method"

    .line 2
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    if-nez v0, :cond_12

    return-void

    .line 3
    :cond_12
    invoke-virtual {p1}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object p1

    const/4 v1, 0x2

    invoke-virtual {v0, p1, v1}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    return-void
.end method
