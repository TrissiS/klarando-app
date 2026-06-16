.class public Lb/h/m/g0$d;
.super Lb/h/m/g0$f;
.source "WindowInsetsCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/h/m/g0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "d"
.end annotation


# instance fields
.field public final c:Landroid/view/WindowInsets$Builder;


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Lb/h/m/g0$f;-><init>()V

    .line 2
    new-instance v0, Landroid/view/WindowInsets$Builder;

    invoke-direct {v0}, Landroid/view/WindowInsets$Builder;-><init>()V

    iput-object v0, p0, Lb/h/m/g0$d;->c:Landroid/view/WindowInsets$Builder;

    return-void
.end method

.method public constructor <init>(Lb/h/m/g0;)V
    .registers 3

    .line 3
    invoke-direct {p0}, Lb/h/m/g0$f;-><init>()V

    .line 4
    invoke-virtual {p1}, Lb/h/m/g0;->k()Landroid/view/WindowInsets;

    move-result-object p1

    if-eqz p1, :cond_f

    .line 5
    new-instance v0, Landroid/view/WindowInsets$Builder;

    invoke-direct {v0, p1}, Landroid/view/WindowInsets$Builder;-><init>(Landroid/view/WindowInsets;)V

    goto :goto_14

    .line 6
    :cond_f
    new-instance v0, Landroid/view/WindowInsets$Builder;

    invoke-direct {v0}, Landroid/view/WindowInsets$Builder;-><init>()V

    :goto_14
    iput-object v0, p0, Lb/h/m/g0$d;->c:Landroid/view/WindowInsets$Builder;

    return-void
.end method


# virtual methods
.method public a(Lb/h/f/b;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/h/m/g0$d;->c:Landroid/view/WindowInsets$Builder;

    invoke-virtual {p1}, Lb/h/f/b;->a()Landroid/graphics/Insets;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/view/WindowInsets$Builder;->setMandatorySystemGestureInsets(Landroid/graphics/Insets;)Landroid/view/WindowInsets$Builder;

    return-void
.end method

.method public b()Lb/h/m/g0;
    .registers 3

    .line 2
    invoke-virtual {p0}, Lb/h/m/g0$f;->a()V

    .line 3
    iget-object v0, p0, Lb/h/m/g0$d;->c:Landroid/view/WindowInsets$Builder;

    .line 4
    invoke-virtual {v0}, Landroid/view/WindowInsets$Builder;->build()Landroid/view/WindowInsets;

    move-result-object v0

    .line 5
    invoke-static {v0}, Lb/h/m/g0;->a(Landroid/view/WindowInsets;)Lb/h/m/g0;

    move-result-object v0

    .line 6
    iget-object v1, p0, Lb/h/m/g0$f;->b:[Lb/h/f/b;

    invoke-virtual {v0, v1}, Lb/h/m/g0;->a([Lb/h/f/b;)V

    return-object v0
.end method

.method public b(Lb/h/f/b;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/h/m/g0$d;->c:Landroid/view/WindowInsets$Builder;

    invoke-virtual {p1}, Lb/h/f/b;->a()Landroid/graphics/Insets;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/view/WindowInsets$Builder;->setStableInsets(Landroid/graphics/Insets;)Landroid/view/WindowInsets$Builder;

    return-void
.end method

.method public c(Lb/h/f/b;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/h/m/g0$d;->c:Landroid/view/WindowInsets$Builder;

    invoke-virtual {p1}, Lb/h/f/b;->a()Landroid/graphics/Insets;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/view/WindowInsets$Builder;->setSystemGestureInsets(Landroid/graphics/Insets;)Landroid/view/WindowInsets$Builder;

    return-void
.end method

.method public d(Lb/h/f/b;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/h/m/g0$d;->c:Landroid/view/WindowInsets$Builder;

    invoke-virtual {p1}, Lb/h/f/b;->a()Landroid/graphics/Insets;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/view/WindowInsets$Builder;->setSystemWindowInsets(Landroid/graphics/Insets;)Landroid/view/WindowInsets$Builder;

    return-void
.end method

.method public e(Lb/h/f/b;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/h/m/g0$d;->c:Landroid/view/WindowInsets$Builder;

    invoke-virtual {p1}, Lb/h/f/b;->a()Landroid/graphics/Insets;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/view/WindowInsets$Builder;->setTappableElementInsets(Landroid/graphics/Insets;)Landroid/view/WindowInsets$Builder;

    return-void
.end method
