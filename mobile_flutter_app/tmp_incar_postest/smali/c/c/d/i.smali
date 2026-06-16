.class public final Lc/c/d/i;
.super Ljava/lang/Object;
.source "ToastUtils.java"


# static fields
.field public static a:Landroid/app/Application;

.field public static b:Lc/c/d/k/d;

.field public static c:Lc/c/d/k/f;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lc/c/d/k/f<",
            "*>;"
        }
    .end annotation
.end field

.field public static d:Lc/c/d/k/c;


# direct methods
.method public static a(I)V
    .registers 2

    .line 7
    :try_start_0
    sget-object v0, Lc/c/d/i;->a:Landroid/app/Application;

    invoke-virtual {v0}, Landroid/app/Application;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Lc/c/d/i;->a(Ljava/lang/CharSequence;)V
    :try_end_d
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_d} :catch_e

    goto :goto_15

    .line 8
    :catch_e
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lc/c/d/i;->a(Ljava/lang/CharSequence;)V

    :goto_15
    return-void
.end method

.method public static a(III)V
    .registers 4

    const/4 v0, 0x0

    .line 12
    invoke-static {p0, p1, p2, v0, v0}, Lc/c/d/i;->a(IIIFF)V

    return-void
.end method

.method public static a(IIIFF)V
    .registers 14

    .line 13
    sget-object v0, Lc/c/d/i;->b:Lc/c/d/k/d;

    new-instance v8, Lc/c/d/l/b;

    sget-object v2, Lc/c/d/i;->c:Lc/c/d/k/f;

    move-object v1, v8

    move v3, p0

    move v4, p1

    move v5, p2

    move v6, p3

    move v7, p4

    invoke-direct/range {v1 .. v7}, Lc/c/d/l/b;-><init>(Lc/c/d/k/f;IIIFF)V

    invoke-interface {v0, v8}, Lc/c/d/k/d;->a(Lc/c/d/k/f;)V

    return-void
.end method

.method public static a(Landroid/app/Application;)V
    .registers 2

    .line 1
    sget-object v0, Lc/c/d/i;->c:Lc/c/d/k/f;

    invoke-static {p0, v0}, Lc/c/d/i;->a(Landroid/app/Application;Lc/c/d/k/f;)V

    return-void
.end method

.method public static a(Landroid/app/Application;Lc/c/d/k/f;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Application;",
            "Lc/c/d/k/f<",
            "*>;)V"
        }
    .end annotation

    .line 2
    sput-object p0, Lc/c/d/i;->a:Landroid/app/Application;

    .line 3
    sget-object p0, Lc/c/d/i;->b:Lc/c/d/k/d;

    if-nez p0, :cond_e

    .line 4
    new-instance p0, Lc/c/d/h;

    invoke-direct {p0}, Lc/c/d/h;-><init>()V

    invoke-static {p0}, Lc/c/d/i;->a(Lc/c/d/k/d;)V

    :cond_e
    if-nez p1, :cond_15

    .line 5
    new-instance p1, Lc/c/d/l/a;

    invoke-direct {p1}, Lc/c/d/l/a;-><init>()V

    .line 6
    :cond_15
    invoke-static {p1}, Lc/c/d/i;->a(Lc/c/d/k/f;)V

    return-void
.end method

.method public static a(Lc/c/d/k/d;)V
    .registers 2

    .line 16
    sput-object p0, Lc/c/d/i;->b:Lc/c/d/k/d;

    .line 17
    sget-object v0, Lc/c/d/i;->a:Landroid/app/Application;

    invoke-interface {p0, v0}, Lc/c/d/k/d;->a(Landroid/app/Application;)V

    return-void
.end method

.method public static a(Lc/c/d/k/f;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lc/c/d/k/f<",
            "*>;)V"
        }
    .end annotation

    .line 14
    sput-object p0, Lc/c/d/i;->c:Lc/c/d/k/f;

    .line 15
    sget-object v0, Lc/c/d/i;->b:Lc/c/d/k/d;

    invoke-interface {v0, p0}, Lc/c/d/k/d;->a(Lc/c/d/k/f;)V

    return-void
.end method

.method public static a(Ljava/lang/CharSequence;)V
    .registers 2

    if-eqz p0, :cond_19

    .line 9
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-nez v0, :cond_9

    goto :goto_19

    .line 10
    :cond_9
    sget-object v0, Lc/c/d/i;->d:Lc/c/d/k/c;

    if-eqz v0, :cond_14

    invoke-interface {v0, p0}, Lc/c/d/k/c;->a(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_14

    return-void

    .line 11
    :cond_14
    sget-object v0, Lc/c/d/i;->b:Lc/c/d/k/d;

    invoke-interface {v0, p0}, Lc/c/d/k/d;->a(Ljava/lang/CharSequence;)V

    :cond_19
    :goto_19
    return-void
.end method
