.class public Lb/h/m/g0$j;
.super Lb/h/m/g0$i;
.source "WindowInsetsCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/h/m/g0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "j"
.end annotation


# instance fields
.field public n:Lb/h/f/b;


# direct methods
.method public constructor <init>(Lb/h/m/g0;Landroid/view/WindowInsets;)V
    .registers 3

    .line 1
    invoke-direct {p0, p1, p2}, Lb/h/m/g0$i;-><init>(Lb/h/m/g0;Landroid/view/WindowInsets;)V

    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Lb/h/m/g0$j;->n:Lb/h/f/b;

    return-void
.end method

.method public constructor <init>(Lb/h/m/g0;Lb/h/m/g0$j;)V
    .registers 3

    .line 3
    invoke-direct {p0, p1, p2}, Lb/h/m/g0$i;-><init>(Lb/h/m/g0;Lb/h/m/g0$i;)V

    const/4 p1, 0x0

    .line 4
    iput-object p1, p0, Lb/h/m/g0$j;->n:Lb/h/f/b;

    return-void
.end method


# virtual methods
.method public a(IIII)Lb/h/m/g0;
    .registers 6

    .line 1
    iget-object v0, p0, Lb/h/m/g0$g;->c:Landroid/view/WindowInsets;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/view/WindowInsets;->inset(IIII)Landroid/view/WindowInsets;

    move-result-object p1

    invoke-static {p1}, Lb/h/m/g0;->a(Landroid/view/WindowInsets;)Lb/h/m/g0;

    move-result-object p1

    return-object p1
.end method

.method public b(Lb/h/f/b;)V
    .registers 2

    return-void
.end method

.method public e()Lb/h/f/b;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/h/m/g0$j;->n:Lb/h/f/b;

    if-nez v0, :cond_10

    .line 2
    iget-object v0, p0, Lb/h/m/g0$g;->c:Landroid/view/WindowInsets;

    .line 3
    invoke-virtual {v0}, Landroid/view/WindowInsets;->getMandatorySystemGestureInsets()Landroid/graphics/Insets;

    move-result-object v0

    invoke-static {v0}, Lb/h/f/b;->a(Landroid/graphics/Insets;)Lb/h/f/b;

    move-result-object v0

    iput-object v0, p0, Lb/h/m/g0$j;->n:Lb/h/f/b;

    .line 4
    :cond_10
    iget-object v0, p0, Lb/h/m/g0$j;->n:Lb/h/f/b;

    return-object v0
.end method
