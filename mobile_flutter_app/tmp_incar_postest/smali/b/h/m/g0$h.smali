.class public Lb/h/m/g0$h;
.super Lb/h/m/g0$g;
.source "WindowInsetsCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/h/m/g0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "h"
.end annotation


# instance fields
.field public m:Lb/h/f/b;


# direct methods
.method public constructor <init>(Lb/h/m/g0;Landroid/view/WindowInsets;)V
    .registers 3

    .line 1
    invoke-direct {p0, p1, p2}, Lb/h/m/g0$g;-><init>(Lb/h/m/g0;Landroid/view/WindowInsets;)V

    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Lb/h/m/g0$h;->m:Lb/h/f/b;

    return-void
.end method

.method public constructor <init>(Lb/h/m/g0;Lb/h/m/g0$h;)V
    .registers 3

    .line 3
    invoke-direct {p0, p1, p2}, Lb/h/m/g0$g;-><init>(Lb/h/m/g0;Lb/h/m/g0$g;)V

    const/4 p1, 0x0

    .line 4
    iput-object p1, p0, Lb/h/m/g0$h;->m:Lb/h/f/b;

    .line 5
    iget-object p1, p2, Lb/h/m/g0$h;->m:Lb/h/f/b;

    iput-object p1, p0, Lb/h/m/g0$h;->m:Lb/h/f/b;

    return-void
.end method


# virtual methods
.method public b()Lb/h/m/g0;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/h/m/g0$g;->c:Landroid/view/WindowInsets;

    invoke-virtual {v0}, Landroid/view/WindowInsets;->consumeStableInsets()Landroid/view/WindowInsets;

    move-result-object v0

    invoke-static {v0}, Lb/h/m/g0;->a(Landroid/view/WindowInsets;)Lb/h/m/g0;

    move-result-object v0

    return-object v0
.end method

.method public b(Lb/h/f/b;)V
    .registers 2

    .line 2
    iput-object p1, p0, Lb/h/m/g0$h;->m:Lb/h/f/b;

    return-void
.end method

.method public c()Lb/h/m/g0;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/h/m/g0$g;->c:Landroid/view/WindowInsets;

    invoke-virtual {v0}, Landroid/view/WindowInsets;->consumeSystemWindowInsets()Landroid/view/WindowInsets;

    move-result-object v0

    invoke-static {v0}, Lb/h/m/g0;->a(Landroid/view/WindowInsets;)Lb/h/m/g0;

    move-result-object v0

    return-object v0
.end method

.method public final f()Lb/h/f/b;
    .registers 5

    .line 1
    iget-object v0, p0, Lb/h/m/g0$h;->m:Lb/h/f/b;

    if-nez v0, :cond_22

    .line 2
    iget-object v0, p0, Lb/h/m/g0$g;->c:Landroid/view/WindowInsets;

    .line 3
    invoke-virtual {v0}, Landroid/view/WindowInsets;->getStableInsetLeft()I

    move-result v0

    iget-object v1, p0, Lb/h/m/g0$g;->c:Landroid/view/WindowInsets;

    .line 4
    invoke-virtual {v1}, Landroid/view/WindowInsets;->getStableInsetTop()I

    move-result v1

    iget-object v2, p0, Lb/h/m/g0$g;->c:Landroid/view/WindowInsets;

    .line 5
    invoke-virtual {v2}, Landroid/view/WindowInsets;->getStableInsetRight()I

    move-result v2

    iget-object v3, p0, Lb/h/m/g0$g;->c:Landroid/view/WindowInsets;

    .line 6
    invoke-virtual {v3}, Landroid/view/WindowInsets;->getStableInsetBottom()I

    move-result v3

    .line 7
    invoke-static {v0, v1, v2, v3}, Lb/h/f/b;->a(IIII)Lb/h/f/b;

    move-result-object v0

    iput-object v0, p0, Lb/h/m/g0$h;->m:Lb/h/f/b;

    .line 8
    :cond_22
    iget-object v0, p0, Lb/h/m/g0$h;->m:Lb/h/f/b;

    return-object v0
.end method

.method public h()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lb/h/m/g0$g;->c:Landroid/view/WindowInsets;

    invoke-virtual {v0}, Landroid/view/WindowInsets;->isConsumed()Z

    move-result v0

    return v0
.end method
