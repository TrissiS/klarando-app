.class public abstract Ld/a/a/c$e;
.super Landroidx/recyclerview/widget/RecyclerView$b0;
.source "BaseAdapter.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ld/a/a/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401
    name = "e"
.end annotation


# instance fields
.field public final synthetic A:Ld/a/a/c;


# direct methods
.method public constructor <init>(Ld/a/a/c;I)V
    .registers 6

    .line 1
    invoke-virtual {p1}, Ld/a/a/c;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    invoke-static {p1}, Ld/a/a/c;->a(Ld/a/a/c;)Landroidx/recyclerview/widget/RecyclerView;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, p2, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    invoke-direct {p0, p1, p2}, Ld/a/a/c$e;-><init>(Ld/a/a/c;Landroid/view/View;)V

    return-void
.end method

.method public constructor <init>(Ld/a/a/c;Landroid/view/View;)V
    .registers 5

    .line 2
    iput-object p1, p0, Ld/a/a/c$e;->A:Ld/a/a/c;

    .line 3
    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$b0;-><init>(Landroid/view/View;)V

    .line 4
    invoke-static {p1}, Ld/a/a/c;->b(Ld/a/a/c;)Ld/a/a/c$c;

    move-result-object v0

    if-eqz v0, :cond_e

    .line 5
    invoke-virtual {p2, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 6
    :cond_e
    invoke-static {p1}, Ld/a/a/c;->c(Ld/a/a/c;)Ld/a/a/c$d;

    move-result-object v0

    if-eqz v0, :cond_17

    .line 7
    invoke-virtual {p2, p0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 8
    :cond_17
    invoke-static {p1}, Ld/a/a/c;->d(Ld/a/a/c;)Landroid/util/SparseArray;

    move-result-object p2

    const/4 v0, 0x0

    if-eqz p2, :cond_3d

    const/4 p2, 0x0

    .line 9
    :goto_1f
    invoke-static {p1}, Ld/a/a/c;->d(Ld/a/a/c;)Landroid/util/SparseArray;

    move-result-object v1

    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    move-result v1

    if-ge p2, v1, :cond_3d

    .line 10
    invoke-static {p1}, Ld/a/a/c;->d(Ld/a/a/c;)Landroid/util/SparseArray;

    move-result-object v1

    invoke-virtual {v1, p2}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v1

    invoke-virtual {p0, v1}, Ld/a/a/c$e;->findViewById(I)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_3a

    .line 11
    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_3a
    add-int/lit8 p2, p2, 0x1

    goto :goto_1f

    .line 12
    :cond_3d
    invoke-static {p1}, Ld/a/a/c;->e(Ld/a/a/c;)Landroid/util/SparseArray;

    move-result-object p2

    if-eqz p2, :cond_61

    .line 13
    :goto_43
    invoke-static {p1}, Ld/a/a/c;->e(Ld/a/a/c;)Landroid/util/SparseArray;

    move-result-object p2

    invoke-virtual {p2}, Landroid/util/SparseArray;->size()I

    move-result p2

    if-ge v0, p2, :cond_61

    .line 14
    invoke-static {p1}, Ld/a/a/c;->e(Ld/a/a/c;)Landroid/util/SparseArray;

    move-result-object p2

    invoke-virtual {p2, v0}, Landroid/util/SparseArray;->keyAt(I)I

    move-result p2

    invoke-virtual {p0, p2}, Ld/a/a/c$e;->findViewById(I)Landroid/view/View;

    move-result-object p2

    if-eqz p2, :cond_5e

    .line 15
    invoke-virtual {p2, p0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    :cond_5e
    add-int/lit8 v0, v0, 0x1

    goto :goto_43

    :cond_61
    return-void
.end method


# virtual methods
.method public final C()Landroid/view/View;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$b0;->h:Landroid/view/View;

    return-object v0
.end method

.method public final D()I
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$b0;->j()I

    move-result v0

    iget-object v1, p0, Ld/a/a/c$e;->A:Ld/a/a/c;

    invoke-static {v1}, Ld/a/a/c;->f(Ld/a/a/c;)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public abstract c(I)V
.end method

.method public final findViewById(I)Landroid/view/View;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Landroid/view/View;",
            ">(I)TV;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ld/a/a/c$e;->C()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public onClick(Landroid/view/View;)V
    .registers 5

    .line 1
    invoke-virtual {p0}, Ld/a/a/c$e;->D()I

    move-result v0

    if-ltz v0, :cond_50

    .line 2
    iget-object v1, p0, Ld/a/a/c$e;->A:Ld/a/a/c;

    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView$g;->b()I

    move-result v1

    if-lt v0, v1, :cond_f

    goto :goto_50

    .line 3
    :cond_f
    invoke-virtual {p0}, Ld/a/a/c$e;->C()Landroid/view/View;

    move-result-object v1

    if-ne p1, v1, :cond_2d

    .line 4
    iget-object v1, p0, Ld/a/a/c$e;->A:Ld/a/a/c;

    invoke-static {v1}, Ld/a/a/c;->b(Ld/a/a/c;)Ld/a/a/c$c;

    move-result-object v1

    if-eqz v1, :cond_2c

    .line 5
    iget-object v1, p0, Ld/a/a/c$e;->A:Ld/a/a/c;

    invoke-static {v1}, Ld/a/a/c;->b(Ld/a/a/c;)Ld/a/a/c$c;

    move-result-object v1

    iget-object v2, p0, Ld/a/a/c$e;->A:Ld/a/a/c;

    invoke-static {v2}, Ld/a/a/c;->a(Ld/a/a/c;)Landroidx/recyclerview/widget/RecyclerView;

    move-result-object v2

    invoke-interface {v1, v2, p1, v0}, Ld/a/a/c$c;->a(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;I)V

    :cond_2c
    return-void

    .line 6
    :cond_2d
    iget-object v1, p0, Ld/a/a/c$e;->A:Ld/a/a/c;

    invoke-static {v1}, Ld/a/a/c;->d(Ld/a/a/c;)Landroid/util/SparseArray;

    move-result-object v1

    if-eqz v1, :cond_50

    .line 7
    iget-object v1, p0, Ld/a/a/c$e;->A:Ld/a/a/c;

    invoke-static {v1}, Ld/a/a/c;->d(Ld/a/a/c;)Landroid/util/SparseArray;

    move-result-object v1

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ld/a/a/c$a;

    if-eqz v1, :cond_50

    .line 8
    iget-object v2, p0, Ld/a/a/c$e;->A:Ld/a/a/c;

    invoke-static {v2}, Ld/a/a/c;->a(Ld/a/a/c;)Landroidx/recyclerview/widget/RecyclerView;

    move-result-object v2

    invoke-interface {v1, v2, p1, v0}, Ld/a/a/c$a;->a(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;I)V

    :cond_50
    :goto_50
    return-void
.end method

.method public onLongClick(Landroid/view/View;)Z
    .registers 6

    .line 1
    invoke-virtual {p0}, Ld/a/a/c$e;->D()I

    move-result v0

    const/4 v1, 0x0

    if-ltz v0, :cond_55

    .line 2
    iget-object v2, p0, Ld/a/a/c$e;->A:Ld/a/a/c;

    invoke-virtual {v2}, Landroidx/recyclerview/widget/RecyclerView$g;->b()I

    move-result v2

    if-lt v0, v2, :cond_10

    goto :goto_55

    .line 3
    :cond_10
    invoke-virtual {p0}, Ld/a/a/c$e;->C()Landroid/view/View;

    move-result-object v2

    if-ne p1, v2, :cond_30

    .line 4
    iget-object v2, p0, Ld/a/a/c$e;->A:Ld/a/a/c;

    invoke-static {v2}, Ld/a/a/c;->c(Ld/a/a/c;)Ld/a/a/c$d;

    move-result-object v2

    if-eqz v2, :cond_2f

    .line 5
    iget-object v1, p0, Ld/a/a/c$e;->A:Ld/a/a/c;

    invoke-static {v1}, Ld/a/a/c;->c(Ld/a/a/c;)Ld/a/a/c$d;

    move-result-object v1

    iget-object v2, p0, Ld/a/a/c$e;->A:Ld/a/a/c;

    invoke-static {v2}, Ld/a/a/c;->a(Ld/a/a/c;)Landroidx/recyclerview/widget/RecyclerView;

    move-result-object v2

    invoke-interface {v1, v2, p1, v0}, Ld/a/a/c$d;->a(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;I)Z

    move-result p1

    return p1

    :cond_2f
    return v1

    .line 6
    :cond_30
    iget-object v2, p0, Ld/a/a/c$e;->A:Ld/a/a/c;

    invoke-static {v2}, Ld/a/a/c;->e(Ld/a/a/c;)Landroid/util/SparseArray;

    move-result-object v2

    if-eqz v2, :cond_55

    .line 7
    iget-object v2, p0, Ld/a/a/c$e;->A:Ld/a/a/c;

    invoke-static {v2}, Ld/a/a/c;->e(Ld/a/a/c;)Landroid/util/SparseArray;

    move-result-object v2

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ld/a/a/c$b;

    if-eqz v2, :cond_55

    .line 8
    iget-object v1, p0, Ld/a/a/c$e;->A:Ld/a/a/c;

    invoke-static {v1}, Ld/a/a/c;->a(Ld/a/a/c;)Landroidx/recyclerview/widget/RecyclerView;

    move-result-object v1

    invoke-interface {v2, v1, p1, v0}, Ld/a/a/c$b;->a(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;I)Z

    move-result p1

    return p1

    :cond_55
    :goto_55
    return v1
.end method
