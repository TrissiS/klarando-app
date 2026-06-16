.class public final synthetic Ld/a/a/g/a;
.super Ljava/lang/Object;
.source "ActivityAction.java"


# direct methods
.method public static a(Ld/a/a/g/b;)Landroid/app/Activity;
    .registers 4
    .param p0, "_this"    # Ld/a/a/g/b;

    .line 1
    invoke-interface {p0}, Ld/a/a/g/b;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 2
    :cond_4
    instance-of v1, v0, Landroid/app/Activity;

    if-eqz v1, :cond_b

    .line 3
    check-cast v0, Landroid/app/Activity;

    return-object v0

    .line 4
    :cond_b
    instance-of v1, v0, Landroid/content/ContextWrapper;

    const/4 v2, 0x0

    if-eqz v1, :cond_18

    .line 5
    check-cast v0, Landroid/content/ContextWrapper;

    invoke-virtual {v0}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    if-nez v0, :cond_4

    :cond_18
    return-object v2
.end method

.method public static a(Ld/a/a/g/b;Landroid/content/Intent;)V
    .registers 3
    .param p0, "_this"    # Ld/a/a/g/b;

    .line 7
    invoke-interface {p0}, Ld/a/a/g/b;->getContext()Landroid/content/Context;

    move-result-object v0

    instance-of v0, v0, Landroid/app/Activity;

    if-nez v0, :cond_d

    const/high16 v0, 0x10000000

    .line 8
    invoke-virtual {p1, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 9
    :cond_d
    invoke-interface {p0}, Ld/a/a/g/b;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public static a(Ld/a/a/g/b;Ljava/lang/Class;)V
    .registers 4
    .param p0, "_this"    # Ld/a/a/g/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+",
            "Landroid/app/Activity;",
            ">;)V"
        }
    .end annotation

    .line 6
    new-instance v0, Landroid/content/Intent;

    invoke-interface {p0}, Ld/a/a/g/b;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-interface {p0, v0}, Ld/a/a/g/b;->startActivity(Landroid/content/Intent;)V

    return-void
.end method
