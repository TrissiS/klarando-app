.class public Lb/p/d/k;
.super Lb/h/m/a;
.source "RecyclerViewAccessibilityDelegate.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/p/d/k$a;
    }
.end annotation


# instance fields
.field public final d:Landroidx/recyclerview/widget/RecyclerView;

.field public final e:Lb/p/d/k$a;


# direct methods
.method public constructor <init>(Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 3

    .line 1
    invoke-direct {p0}, Lb/h/m/a;-><init>()V

    .line 2
    iput-object p1, p0, Lb/p/d/k;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 3
    invoke-virtual {p0}, Lb/p/d/k;->b()Lb/h/m/a;

    move-result-object p1

    if-eqz p1, :cond_14

    .line 4
    instance-of v0, p1, Lb/p/d/k$a;

    if-eqz v0, :cond_14

    .line 5
    check-cast p1, Lb/p/d/k$a;

    iput-object p1, p0, Lb/p/d/k;->e:Lb/p/d/k$a;

    goto :goto_1b

    .line 6
    :cond_14
    new-instance p1, Lb/p/d/k$a;

    invoke-direct {p1, p0}, Lb/p/d/k$a;-><init>(Lb/p/d/k;)V

    iput-object p1, p0, Lb/p/d/k;->e:Lb/p/d/k$a;

    :goto_1b
    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;Lb/h/m/h0/c;)V
    .registers 3

    .line 4
    invoke-super {p0, p1, p2}, Lb/h/m/a;->a(Landroid/view/View;Lb/h/m/h0/c;)V

    .line 5
    invoke-virtual {p0}, Lb/p/d/k;->c()Z

    move-result p1

    if-nez p1, :cond_1a

    iget-object p1, p0, Lb/p/d/k;->d:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    move-result-object p1

    if-eqz p1, :cond_1a

    .line 6
    iget-object p1, p0, Lb/p/d/k;->d:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView$o;->a(Lb/h/m/h0/c;)V

    :cond_1a
    return-void
.end method

.method public a(Landroid/view/View;ILandroid/os/Bundle;)Z
    .registers 4

    .line 1
    invoke-super {p0, p1, p2, p3}, Lb/h/m/a;->a(Landroid/view/View;ILandroid/os/Bundle;)Z

    move-result p1

    if-eqz p1, :cond_8

    const/4 p1, 0x1

    return p1

    .line 2
    :cond_8
    invoke-virtual {p0}, Lb/p/d/k;->c()Z

    move-result p1

    if-nez p1, :cond_21

    iget-object p1, p0, Lb/p/d/k;->d:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    move-result-object p1

    if-eqz p1, :cond_21

    .line 3
    iget-object p1, p0, Lb/p/d/k;->d:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    move-result-object p1

    invoke-virtual {p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView$o;->a(ILandroid/os/Bundle;)Z

    move-result p1

    return p1

    :cond_21
    const/4 p1, 0x0

    return p1
.end method

.method public b()Lb/h/m/a;
    .registers 2

    .line 6
    iget-object v0, p0, Lb/p/d/k;->e:Lb/p/d/k$a;

    return-object v0
.end method

.method public b(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V
    .registers 4

    .line 1
    invoke-super {p0, p1, p2}, Lb/h/m/a;->b(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V

    .line 2
    instance-of v0, p1, Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v0, :cond_1c

    invoke-virtual {p0}, Lb/p/d/k;->c()Z

    move-result v0

    if-nez v0, :cond_1c

    .line 3
    check-cast p1, Landroidx/recyclerview/widget/RecyclerView;

    .line 4
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    move-result-object v0

    if-eqz v0, :cond_1c

    .line 5
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView$o;->a(Landroid/view/accessibility/AccessibilityEvent;)V

    :cond_1c
    return-void
.end method

.method public c()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lb/p/d/k;->d:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->p()Z

    move-result v0

    return v0
.end method
