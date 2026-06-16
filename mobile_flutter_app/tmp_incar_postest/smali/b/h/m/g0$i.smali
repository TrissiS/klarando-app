.class public Lb/h/m/g0$i;
.super Lb/h/m/g0$h;
.source "WindowInsetsCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/h/m/g0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "i"
.end annotation


# direct methods
.method public constructor <init>(Lb/h/m/g0;Landroid/view/WindowInsets;)V
    .registers 3

    .line 1
    invoke-direct {p0, p1, p2}, Lb/h/m/g0$h;-><init>(Lb/h/m/g0;Landroid/view/WindowInsets;)V

    return-void
.end method

.method public constructor <init>(Lb/h/m/g0;Lb/h/m/g0$i;)V
    .registers 3

    .line 2
    invoke-direct {p0, p1, p2}, Lb/h/m/g0$h;-><init>(Lb/h/m/g0;Lb/h/m/g0$h;)V

    return-void
.end method


# virtual methods
.method public a()Lb/h/m/g0;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/h/m/g0$g;->c:Landroid/view/WindowInsets;

    invoke-virtual {v0}, Landroid/view/WindowInsets;->consumeDisplayCutout()Landroid/view/WindowInsets;

    move-result-object v0

    invoke-static {v0}, Lb/h/m/g0;->a(Landroid/view/WindowInsets;)Lb/h/m/g0;

    move-result-object v0

    return-object v0
.end method

.method public d()Lb/h/m/d;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/h/m/g0$g;->c:Landroid/view/WindowInsets;

    invoke-virtual {v0}, Landroid/view/WindowInsets;->getDisplayCutout()Landroid/view/DisplayCutout;

    move-result-object v0

    invoke-static {v0}, Lb/h/m/d;->a(Ljava/lang/Object;)Lb/h/m/d;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    .line 1
    :cond_4
    instance-of v1, p1, Lb/h/m/g0$i;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    .line 2
    :cond_a
    check-cast p1, Lb/h/m/g0$i;

    .line 3
    iget-object v1, p0, Lb/h/m/g0$g;->c:Landroid/view/WindowInsets;

    iget-object v3, p1, Lb/h/m/g0$g;->c:Landroid/view/WindowInsets;

    invoke-static {v1, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_21

    iget-object v1, p0, Lb/h/m/g0$g;->f:Lb/h/f/b;

    iget-object p1, p1, Lb/h/m/g0$g;->f:Lb/h/f/b;

    .line 4
    invoke-static {v1, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_21

    goto :goto_22

    :cond_21
    const/4 v0, 0x0

    :goto_22
    return v0
.end method

.method public hashCode()I
    .registers 2

    .line 1
    iget-object v0, p0, Lb/h/m/g0$g;->c:Landroid/view/WindowInsets;

    invoke-virtual {v0}, Landroid/view/WindowInsets;->hashCode()I

    move-result v0

    return v0
.end method
