.class public Lcom/google/android/material/bottomappbar/BottomAppBar$b;
.super Ljava/lang/Object;
.source "BottomAppBar.java"

# interfaces
.implements Lc/a/a/a/m/k;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/material/bottomappbar/BottomAppBar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lc/a/a/a/m/k<",
        "Lcom/google/android/material/floatingactionbutton/FloatingActionButton;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Lcom/google/android/material/bottomappbar/BottomAppBar;


# direct methods
.method public constructor <init>(Lcom/google/android/material/bottomappbar/BottomAppBar;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lcom/google/android/material/bottomappbar/BottomAppBar$b;->a:Lcom/google/android/material/bottomappbar/BottomAppBar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic a(Landroid/view/View;)V
    .registers 2

    .line 1
    check-cast p1, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomappbar/BottomAppBar$b;->a(Lcom/google/android/material/floatingactionbutton/FloatingActionButton;)V

    return-void
.end method

.method public a(Lcom/google/android/material/floatingactionbutton/FloatingActionButton;)V
    .registers 4

    .line 2
    iget-object v0, p0, Lcom/google/android/material/bottomappbar/BottomAppBar$b;->a:Lcom/google/android/material/bottomappbar/BottomAppBar;

    invoke-static {v0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->s(Lcom/google/android/material/bottomappbar/BottomAppBar;)Lc/a/a/a/l0/h;

    move-result-object v0

    .line 3
    invoke-virtual {p1}, Landroid/widget/ImageButton;->getVisibility()I

    move-result v1

    if-nez v1, :cond_11

    invoke-virtual {p1}, Landroid/widget/ImageButton;->getScaleY()F

    move-result p1

    goto :goto_12

    :cond_11
    const/4 p1, 0x0

    .line 4
    :goto_12
    invoke-virtual {v0, p1}, Lc/a/a/a/l0/h;->c(F)V

    return-void
.end method

.method public bridge synthetic b(Landroid/view/View;)V
    .registers 2

    .line 1
    check-cast p1, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomappbar/BottomAppBar$b;->b(Lcom/google/android/material/floatingactionbutton/FloatingActionButton;)V

    return-void
.end method

.method public b(Lcom/google/android/material/floatingactionbutton/FloatingActionButton;)V
    .registers 5

    .line 2
    invoke-virtual {p1}, Landroid/widget/ImageButton;->getTranslationX()F

    move-result v0

    .line 3
    iget-object v1, p0, Lcom/google/android/material/bottomappbar/BottomAppBar$b;->a:Lcom/google/android/material/bottomappbar/BottomAppBar;

    invoke-static {v1}, Lcom/google/android/material/bottomappbar/BottomAppBar;->t(Lcom/google/android/material/bottomappbar/BottomAppBar;)Lc/a/a/a/p/a;

    move-result-object v1

    invoke-virtual {v1}, Lc/a/a/a/p/a;->g()F

    move-result v1

    cmpl-float v1, v1, v0

    if-eqz v1, :cond_24

    .line 4
    iget-object v1, p0, Lcom/google/android/material/bottomappbar/BottomAppBar$b;->a:Lcom/google/android/material/bottomappbar/BottomAppBar;

    invoke-static {v1}, Lcom/google/android/material/bottomappbar/BottomAppBar;->t(Lcom/google/android/material/bottomappbar/BottomAppBar;)Lc/a/a/a/p/a;

    move-result-object v1

    invoke-virtual {v1, v0}, Lc/a/a/a/p/a;->f(F)V

    .line 5
    iget-object v0, p0, Lcom/google/android/material/bottomappbar/BottomAppBar$b;->a:Lcom/google/android/material/bottomappbar/BottomAppBar;

    invoke-static {v0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->s(Lcom/google/android/material/bottomappbar/BottomAppBar;)Lc/a/a/a/l0/h;

    move-result-object v0

    invoke-virtual {v0}, Lc/a/a/a/l0/h;->invalidateSelf()V

    .line 6
    :cond_24
    invoke-virtual {p1}, Landroid/widget/ImageButton;->getTranslationY()F

    move-result v0

    neg-float v0, v0

    const/4 v1, 0x0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    .line 7
    iget-object v2, p0, Lcom/google/android/material/bottomappbar/BottomAppBar$b;->a:Lcom/google/android/material/bottomappbar/BottomAppBar;

    invoke-static {v2}, Lcom/google/android/material/bottomappbar/BottomAppBar;->t(Lcom/google/android/material/bottomappbar/BottomAppBar;)Lc/a/a/a/p/a;

    move-result-object v2

    invoke-virtual {v2}, Lc/a/a/a/p/a;->b()F

    move-result v2

    cmpl-float v2, v2, v0

    if-eqz v2, :cond_4e

    .line 8
    iget-object v2, p0, Lcom/google/android/material/bottomappbar/BottomAppBar$b;->a:Lcom/google/android/material/bottomappbar/BottomAppBar;

    invoke-static {v2}, Lcom/google/android/material/bottomappbar/BottomAppBar;->t(Lcom/google/android/material/bottomappbar/BottomAppBar;)Lc/a/a/a/p/a;

    move-result-object v2

    invoke-virtual {v2, v0}, Lc/a/a/a/p/a;->a(F)V

    .line 9
    iget-object v0, p0, Lcom/google/android/material/bottomappbar/BottomAppBar$b;->a:Lcom/google/android/material/bottomappbar/BottomAppBar;

    invoke-static {v0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->s(Lcom/google/android/material/bottomappbar/BottomAppBar;)Lc/a/a/a/l0/h;

    move-result-object v0

    invoke-virtual {v0}, Lc/a/a/a/l0/h;->invalidateSelf()V

    .line 10
    :cond_4e
    iget-object v0, p0, Lcom/google/android/material/bottomappbar/BottomAppBar$b;->a:Lcom/google/android/material/bottomappbar/BottomAppBar;

    invoke-static {v0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->s(Lcom/google/android/material/bottomappbar/BottomAppBar;)Lc/a/a/a/l0/h;

    move-result-object v0

    .line 11
    invoke-virtual {p1}, Landroid/widget/ImageButton;->getVisibility()I

    move-result v2

    if-nez v2, :cond_5e

    invoke-virtual {p1}, Landroid/widget/ImageButton;->getScaleY()F

    move-result v1

    .line 12
    :cond_5e
    invoke-virtual {v0, v1}, Lc/a/a/a/l0/h;->c(F)V

    return-void
.end method
