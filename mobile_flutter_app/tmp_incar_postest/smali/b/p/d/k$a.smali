.class public Lb/p/d/k$a;
.super Lb/h/m/a;
.source "RecyclerViewAccessibilityDelegate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/p/d/k;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public final d:Lb/p/d/k;

.field public e:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/view/View;",
            "Lb/h/m/a;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lb/p/d/k;)V
    .registers 3

    .line 1
    invoke-direct {p0}, Lb/h/m/a;-><init>()V

    .line 2
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v0, p0, Lb/p/d/k$a;->e:Ljava/util/Map;

    .line 3
    iput-object p1, p0, Lb/p/d/k$a;->d:Lb/p/d/k;

    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;)Lb/h/m/h0/d;
    .registers 3

    .line 26
    iget-object v0, p0, Lb/p/d/k$a;->e:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/h/m/a;

    if-eqz v0, :cond_f

    .line 27
    invoke-virtual {v0, p1}, Lb/h/m/a;->a(Landroid/view/View;)Lb/h/m/h0/d;

    move-result-object p1

    return-object p1

    .line 28
    :cond_f
    invoke-super {p0, p1}, Lb/h/m/a;->a(Landroid/view/View;)Lb/h/m/h0/d;

    move-result-object p1

    return-object p1
.end method

.method public a(Landroid/view/View;I)V
    .registers 4

    .line 17
    iget-object v0, p0, Lb/p/d/k$a;->e:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/h/m/a;

    if-eqz v0, :cond_e

    .line 18
    invoke-virtual {v0, p1, p2}, Lb/h/m/a;->a(Landroid/view/View;I)V

    goto :goto_11

    .line 19
    :cond_e
    invoke-super {p0, p1, p2}, Lb/h/m/a;->a(Landroid/view/View;I)V

    :goto_11
    return-void
.end method

.method public a(Landroid/view/View;Lb/h/m/h0/c;)V
    .registers 4

    .line 1
    iget-object v0, p0, Lb/p/d/k$a;->d:Lb/p/d/k;

    invoke-virtual {v0}, Lb/p/d/k;->c()Z

    move-result v0

    if-nez v0, :cond_2f

    iget-object v0, p0, Lb/p/d/k$a;->d:Lb/p/d/k;

    iget-object v0, v0, Lb/p/d/k;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    move-result-object v0

    if-eqz v0, :cond_2f

    .line 3
    iget-object v0, p0, Lb/p/d/k$a;->d:Lb/p/d/k;

    iget-object v0, v0, Lb/p/d/k;->d:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    move-result-object v0

    .line 4
    invoke-virtual {v0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$o;->a(Landroid/view/View;Lb/h/m/h0/c;)V

    .line 5
    iget-object v0, p0, Lb/p/d/k$a;->e:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/h/m/a;

    if-eqz v0, :cond_2b

    .line 6
    invoke-virtual {v0, p1, p2}, Lb/h/m/a;->a(Landroid/view/View;Lb/h/m/h0/c;)V

    goto :goto_32

    .line 7
    :cond_2b
    invoke-super {p0, p1, p2}, Lb/h/m/a;->a(Landroid/view/View;Lb/h/m/h0/c;)V

    goto :goto_32

    .line 8
    :cond_2f
    invoke-super {p0, p1, p2}, Lb/h/m/a;->a(Landroid/view/View;Lb/h/m/h0/c;)V

    :goto_32
    return-void
.end method

.method public a(Landroid/view/View;ILandroid/os/Bundle;)Z
    .registers 6

    .line 9
    iget-object v0, p0, Lb/p/d/k$a;->d:Lb/p/d/k;

    invoke-virtual {v0}, Lb/p/d/k;->c()Z

    move-result v0

    if-nez v0, :cond_38

    iget-object v0, p0, Lb/p/d/k$a;->d:Lb/p/d/k;

    iget-object v0, v0, Lb/p/d/k;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 10
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    move-result-object v0

    if-eqz v0, :cond_38

    .line 11
    iget-object v0, p0, Lb/p/d/k$a;->e:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/h/m/a;

    const/4 v1, 0x1

    if-eqz v0, :cond_24

    .line 12
    invoke-virtual {v0, p1, p2, p3}, Lb/h/m/a;->a(Landroid/view/View;ILandroid/os/Bundle;)Z

    move-result v0

    if-eqz v0, :cond_2b

    return v1

    .line 13
    :cond_24
    invoke-super {p0, p1, p2, p3}, Lb/h/m/a;->a(Landroid/view/View;ILandroid/os/Bundle;)Z

    move-result v0

    if-eqz v0, :cond_2b

    return v1

    .line 14
    :cond_2b
    iget-object v0, p0, Lb/p/d/k$a;->d:Lb/p/d/k;

    iget-object v0, v0, Lb/p/d/k;->d:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    move-result-object v0

    .line 15
    invoke-virtual {v0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView$o;->a(Landroid/view/View;ILandroid/os/Bundle;)Z

    move-result p1

    return p1

    .line 16
    :cond_38
    invoke-super {p0, p1, p2, p3}, Lb/h/m/a;->a(Landroid/view/View;ILandroid/os/Bundle;)Z

    move-result p1

    return p1
.end method

.method public a(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)Z
    .registers 4

    .line 20
    iget-object v0, p0, Lb/p/d/k$a;->e:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/h/m/a;

    if-eqz v0, :cond_f

    .line 21
    invoke-virtual {v0, p1, p2}, Lb/h/m/a;->a(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)Z

    move-result p1

    return p1

    .line 22
    :cond_f
    invoke-super {p0, p1, p2}, Lb/h/m/a;->a(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)Z

    move-result p1

    return p1
.end method

.method public a(Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)Z
    .registers 5

    .line 23
    iget-object v0, p0, Lb/p/d/k$a;->e:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/h/m/a;

    if-eqz v0, :cond_f

    .line 24
    invoke-virtual {v0, p1, p2, p3}, Lb/h/m/a;->a(Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)Z

    move-result p1

    return p1

    .line 25
    :cond_f
    invoke-super {p0, p1, p2, p3}, Lb/h/m/a;->a(Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)Z

    move-result p1

    return p1
.end method

.method public b(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V
    .registers 4

    .line 1
    iget-object v0, p0, Lb/p/d/k$a;->e:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/h/m/a;

    if-eqz v0, :cond_e

    .line 2
    invoke-virtual {v0, p1, p2}, Lb/h/m/a;->b(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V

    goto :goto_11

    .line 3
    :cond_e
    invoke-super {p0, p1, p2}, Lb/h/m/a;->b(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V

    :goto_11
    return-void
.end method

.method public c(Landroid/view/View;)Lb/h/m/a;
    .registers 3

    .line 1
    iget-object v0, p0, Lb/p/d/k$a;->e:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lb/h/m/a;

    return-object p1
.end method

.method public c(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V
    .registers 4

    .line 2
    iget-object v0, p0, Lb/p/d/k$a;->e:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/h/m/a;

    if-eqz v0, :cond_e

    .line 3
    invoke-virtual {v0, p1, p2}, Lb/h/m/a;->c(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V

    goto :goto_11

    .line 4
    :cond_e
    invoke-super {p0, p1, p2}, Lb/h/m/a;->c(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V

    :goto_11
    return-void
.end method

.method public d(Landroid/view/View;)V
    .registers 4

    .line 1
    invoke-static {p1}, Lb/h/m/y;->b(Landroid/view/View;)Lb/h/m/a;

    move-result-object v0

    if-eqz v0, :cond_d

    if-eq v0, p0, :cond_d

    .line 2
    iget-object v1, p0, Lb/p/d/k$a;->e:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_d
    return-void
.end method

.method public d(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V
    .registers 4

    .line 3
    iget-object v0, p0, Lb/p/d/k$a;->e:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/h/m/a;

    if-eqz v0, :cond_e

    .line 4
    invoke-virtual {v0, p1, p2}, Lb/h/m/a;->d(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V

    goto :goto_11

    .line 5
    :cond_e
    invoke-super {p0, p1, p2}, Lb/h/m/a;->d(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V

    :goto_11
    return-void
.end method
