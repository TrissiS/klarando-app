.class public Lc/a/a/a/d0/f$c;
.super Landroidx/recyclerview/widget/RecyclerView$g;
.source "NavigationMenuPresenter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lc/a/a/a/d0/f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$g<",
        "Lc/a/a/a/d0/f$l;",
        ">;"
    }
.end annotation


# instance fields
.field public final j:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lc/a/a/a/d0/f$e;",
            ">;"
        }
    .end annotation
.end field

.field public k:Lb/b/p/j/i;

.field public l:Z

.field public final synthetic m:Lc/a/a/a/d0/f;


# direct methods
.method public constructor <init>(Lc/a/a/a/d0/f;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lc/a/a/a/d0/f$c;->m:Lc/a/a/a/d0/f;

    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$g;-><init>()V

    .line 2
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lc/a/a/a/d0/f$c;->j:Ljava/util/ArrayList;

    .line 3
    invoke-virtual {p0}, Lc/a/a/a/d0/f$c;->j()V

    return-void
.end method


# virtual methods
.method public a(Landroid/os/Bundle;)V
    .registers 8

    const/4 v0, 0x0

    const-string v1, "android:menu:checked"

    .line 31
    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    if-eqz v1, :cond_3b

    const/4 v2, 0x1

    .line 32
    iput-boolean v2, p0, Lc/a/a/a/d0/f$c;->l:Z

    .line 33
    iget-object v2, p0, Lc/a/a/a/d0/f$c;->j:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    :goto_13
    if-ge v3, v2, :cond_36

    .line 34
    iget-object v4, p0, Lc/a/a/a/d0/f$c;->j:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lc/a/a/a/d0/f$e;

    .line 35
    instance-of v5, v4, Lc/a/a/a/d0/f$g;

    if-eqz v5, :cond_33

    .line 36
    check-cast v4, Lc/a/a/a/d0/f$g;

    invoke-virtual {v4}, Lc/a/a/a/d0/f$g;->a()Lb/b/p/j/i;

    move-result-object v4

    if-eqz v4, :cond_33

    .line 37
    invoke-virtual {v4}, Lb/b/p/j/i;->getItemId()I

    move-result v5

    if-ne v5, v1, :cond_33

    .line 38
    invoke-virtual {p0, v4}, Lc/a/a/a/d0/f$c;->a(Lb/b/p/j/i;)V

    goto :goto_36

    :cond_33
    add-int/lit8 v3, v3, 0x1

    goto :goto_13

    .line 39
    :cond_36
    :goto_36
    iput-boolean v0, p0, Lc/a/a/a/d0/f$c;->l:Z

    .line 40
    invoke-virtual {p0}, Lc/a/a/a/d0/f$c;->j()V

    :cond_3b
    const-string v1, "android:menu:action_views"

    .line 41
    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getSparseParcelableArray(Ljava/lang/String;)Landroid/util/SparseArray;

    move-result-object p1

    if-eqz p1, :cond_7b

    .line 42
    iget-object v1, p0, Lc/a/a/a/d0/f$c;->j:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    :goto_49
    if-ge v0, v1, :cond_7b

    .line 43
    iget-object v2, p0, Lc/a/a/a/d0/f$c;->j:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lc/a/a/a/d0/f$e;

    .line 44
    instance-of v3, v2, Lc/a/a/a/d0/f$g;

    if-nez v3, :cond_58

    goto :goto_78

    .line 45
    :cond_58
    check-cast v2, Lc/a/a/a/d0/f$g;

    invoke-virtual {v2}, Lc/a/a/a/d0/f$g;->a()Lb/b/p/j/i;

    move-result-object v2

    if-nez v2, :cond_61

    goto :goto_78

    .line 46
    :cond_61
    invoke-virtual {v2}, Lb/b/p/j/i;->getActionView()Landroid/view/View;

    move-result-object v3

    if-nez v3, :cond_68

    goto :goto_78

    .line 47
    :cond_68
    invoke-virtual {v2}, Lb/b/p/j/i;->getItemId()I

    move-result v2

    invoke-virtual {p1, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/material/internal/ParcelableSparseArray;

    if-nez v2, :cond_75

    goto :goto_78

    .line 48
    :cond_75
    invoke-virtual {v3, v2}, Landroid/view/View;->restoreHierarchyState(Landroid/util/SparseArray;)V

    :goto_78
    add-int/lit8 v0, v0, 0x1

    goto :goto_49

    :cond_7b
    return-void
.end method

.method public a(Lb/b/p/j/i;)V
    .registers 4

    .line 26
    iget-object v0, p0, Lc/a/a/a/d0/f$c;->k:Lb/b/p/j/i;

    if-eq v0, p1, :cond_19

    invoke-virtual {p1}, Lb/b/p/j/i;->isCheckable()Z

    move-result v0

    if-nez v0, :cond_b

    goto :goto_19

    .line 27
    :cond_b
    iget-object v0, p0, Lc/a/a/a/d0/f$c;->k:Lb/b/p/j/i;

    if-eqz v0, :cond_13

    const/4 v1, 0x0

    .line 28
    invoke-virtual {v0, v1}, Lb/b/p/j/i;->setChecked(Z)Landroid/view/MenuItem;

    .line 29
    :cond_13
    iput-object p1, p0, Lc/a/a/a/d0/f$c;->k:Lb/b/p/j/i;

    const/4 v0, 0x1

    .line 30
    invoke-virtual {p1, v0}, Lb/b/p/j/i;->setChecked(Z)Landroid/view/MenuItem;

    :cond_19
    :goto_19
    return-void
.end method

.method public a(Lc/a/a/a/d0/f$l;)V
    .registers 3

    .line 24
    instance-of v0, p1, Lc/a/a/a/d0/f$i;

    if-eqz v0, :cond_b

    .line 25
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$b0;->h:Landroid/view/View;

    check-cast p1, Lcom/google/android/material/internal/NavigationMenuItemView;

    invoke-virtual {p1}, Lcom/google/android/material/internal/NavigationMenuItemView;->f()V

    :cond_b
    return-void
.end method

.method public a(Lc/a/a/a/d0/f$l;I)V
    .registers 6

    .line 1
    invoke-virtual {p0, p2}, Lc/a/a/a/d0/f$c;->c(I)I

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_3e

    const/4 v2, 0x1

    if-eq v0, v2, :cond_26

    const/4 v2, 0x2

    if-eq v0, v2, :cond_f

    goto/16 :goto_a6

    .line 2
    :cond_f
    iget-object v0, p0, Lc/a/a/a/d0/f$c;->j:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lc/a/a/a/d0/f$f;

    .line 3
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$b0;->h:Landroid/view/View;

    invoke-virtual {p2}, Lc/a/a/a/d0/f$f;->b()I

    move-result v0

    invoke-virtual {p2}, Lc/a/a/a/d0/f$f;->a()I

    move-result p2

    invoke-virtual {p1, v1, v0, v1, p2}, Landroid/view/View;->setPadding(IIII)V

    goto/16 :goto_a6

    .line 4
    :cond_26
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$b0;->h:Landroid/view/View;

    check-cast p1, Landroid/widget/TextView;

    .line 5
    iget-object v0, p0, Lc/a/a/a/d0/f$c;->j:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lc/a/a/a/d0/f$g;

    .line 6
    invoke-virtual {p2}, Lc/a/a/a/d0/f$g;->a()Lb/b/p/j/i;

    move-result-object p2

    invoke-virtual {p2}, Lb/b/p/j/i;->getTitle()Ljava/lang/CharSequence;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_a6

    .line 7
    :cond_3e
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$b0;->h:Landroid/view/View;

    check-cast p1, Lcom/google/android/material/internal/NavigationMenuItemView;

    .line 8
    iget-object v0, p0, Lc/a/a/a/d0/f$c;->m:Lc/a/a/a/d0/f;

    iget-object v0, v0, Lc/a/a/a/d0/f;->r:Landroid/content/res/ColorStateList;

    invoke-virtual {p1, v0}, Lcom/google/android/material/internal/NavigationMenuItemView;->setIconTintList(Landroid/content/res/ColorStateList;)V

    .line 9
    iget-object v0, p0, Lc/a/a/a/d0/f$c;->m:Lc/a/a/a/d0/f;

    iget-boolean v2, v0, Lc/a/a/a/d0/f;->p:Z

    if-eqz v2, :cond_54

    .line 10
    iget v0, v0, Lc/a/a/a/d0/f;->o:I

    invoke-virtual {p1, v0}, Lcom/google/android/material/internal/NavigationMenuItemView;->setTextAppearance(I)V

    .line 11
    :cond_54
    iget-object v0, p0, Lc/a/a/a/d0/f$c;->m:Lc/a/a/a/d0/f;

    iget-object v0, v0, Lc/a/a/a/d0/f;->q:Landroid/content/res/ColorStateList;

    if-eqz v0, :cond_5d

    .line 12
    invoke-virtual {p1, v0}, Lcom/google/android/material/internal/NavigationMenuItemView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 13
    :cond_5d
    iget-object v0, p0, Lc/a/a/a/d0/f$c;->m:Lc/a/a/a/d0/f;

    iget-object v0, v0, Lc/a/a/a/d0/f;->s:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_6c

    .line 14
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_6d

    :cond_6c
    const/4 v0, 0x0

    .line 15
    :goto_6d
    invoke-static {p1, v0}, Lb/h/m/y;->a(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 16
    iget-object v0, p0, Lc/a/a/a/d0/f$c;->j:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lc/a/a/a/d0/f$g;

    .line 17
    iget-boolean v0, p2, Lc/a/a/a/d0/f$g;->b:Z

    invoke-virtual {p1, v0}, Lcom/google/android/material/internal/NavigationMenuItemView;->setNeedsEmptyIcon(Z)V

    .line 18
    iget-object v0, p0, Lc/a/a/a/d0/f$c;->m:Lc/a/a/a/d0/f;

    iget v0, v0, Lc/a/a/a/d0/f;->t:I

    invoke-virtual {p1, v0}, Lcom/google/android/material/internal/NavigationMenuItemView;->setHorizontalPadding(I)V

    .line 19
    iget-object v0, p0, Lc/a/a/a/d0/f$c;->m:Lc/a/a/a/d0/f;

    iget v0, v0, Lc/a/a/a/d0/f;->u:I

    invoke-virtual {p1, v0}, Lcom/google/android/material/internal/NavigationMenuItemView;->setIconPadding(I)V

    .line 20
    iget-object v0, p0, Lc/a/a/a/d0/f$c;->m:Lc/a/a/a/d0/f;

    iget-boolean v2, v0, Lc/a/a/a/d0/f;->w:Z

    if-eqz v2, :cond_96

    .line 21
    iget v0, v0, Lc/a/a/a/d0/f;->v:I

    invoke-virtual {p1, v0}, Lcom/google/android/material/internal/NavigationMenuItemView;->setIconSize(I)V

    .line 22
    :cond_96
    iget-object v0, p0, Lc/a/a/a/d0/f$c;->m:Lc/a/a/a/d0/f;

    invoke-static {v0}, Lc/a/a/a/d0/f;->a(Lc/a/a/a/d0/f;)I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/google/android/material/internal/NavigationMenuItemView;->setMaxLines(I)V

    .line 23
    invoke-virtual {p2}, Lc/a/a/a/d0/f$g;->a()Lb/b/p/j/i;

    move-result-object p2

    invoke-virtual {p1, p2, v1}, Lcom/google/android/material/internal/NavigationMenuItemView;->a(Lb/b/p/j/i;I)V

    :goto_a6
    return-void
.end method

.method public b()I
    .registers 2

    .line 3
    iget-object v0, p0, Lc/a/a/a/d0/f$c;->j:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public b(I)J
    .registers 4

    int-to-long v0, p1

    return-wide v0
.end method

.method public bridge synthetic b(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$b0;
    .registers 3

    .line 2
    invoke-virtual {p0, p1, p2}, Lc/a/a/a/d0/f$c;->b(Landroid/view/ViewGroup;I)Lc/a/a/a/d0/f$l;

    move-result-object p1

    return-object p1
.end method

.method public b(Landroid/view/ViewGroup;I)Lc/a/a/a/d0/f$l;
    .registers 5

    if-eqz p2, :cond_2b

    const/4 v0, 0x1

    if-eq p2, v0, :cond_21

    const/4 v0, 0x2

    if-eq p2, v0, :cond_17

    const/4 p1, 0x3

    if-eq p2, p1, :cond_d

    const/4 p1, 0x0

    return-object p1

    .line 4
    :cond_d
    new-instance p1, Lc/a/a/a/d0/f$b;

    iget-object p2, p0, Lc/a/a/a/d0/f$c;->m:Lc/a/a/a/d0/f;

    iget-object p2, p2, Lc/a/a/a/d0/f;->i:Landroid/widget/LinearLayout;

    invoke-direct {p1, p2}, Lc/a/a/a/d0/f$b;-><init>(Landroid/view/View;)V

    return-object p1

    .line 5
    :cond_17
    new-instance p2, Lc/a/a/a/d0/f$j;

    iget-object v0, p0, Lc/a/a/a/d0/f$c;->m:Lc/a/a/a/d0/f;

    iget-object v0, v0, Lc/a/a/a/d0/f;->n:Landroid/view/LayoutInflater;

    invoke-direct {p2, v0, p1}, Lc/a/a/a/d0/f$j;-><init>(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V

    return-object p2

    .line 6
    :cond_21
    new-instance p2, Lc/a/a/a/d0/f$k;

    iget-object v0, p0, Lc/a/a/a/d0/f$c;->m:Lc/a/a/a/d0/f;

    iget-object v0, v0, Lc/a/a/a/d0/f;->n:Landroid/view/LayoutInflater;

    invoke-direct {p2, v0, p1}, Lc/a/a/a/d0/f$k;-><init>(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V

    return-object p2

    .line 7
    :cond_2b
    new-instance p2, Lc/a/a/a/d0/f$i;

    iget-object v0, p0, Lc/a/a/a/d0/f$c;->m:Lc/a/a/a/d0/f;

    iget-object v1, v0, Lc/a/a/a/d0/f;->n:Landroid/view/LayoutInflater;

    iget-object v0, v0, Lc/a/a/a/d0/f;->C:Landroid/view/View$OnClickListener;

    invoke-direct {p2, v1, p1, v0}, Lc/a/a/a/d0/f$i;-><init>(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/view/View$OnClickListener;)V

    return-object p2
.end method

.method public final b(II)V
    .registers 5

    :goto_0
    if-ge p1, p2, :cond_10

    .line 8
    iget-object v0, p0, Lc/a/a/a/d0/f$c;->j:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lc/a/a/a/d0/f$g;

    const/4 v1, 0x1

    .line 9
    iput-boolean v1, v0, Lc/a/a/a/d0/f$g;->b:Z

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_10
    return-void
.end method

.method public bridge synthetic b(Landroidx/recyclerview/widget/RecyclerView$b0;I)V
    .registers 3

    .line 1
    check-cast p1, Lc/a/a/a/d0/f$l;

    invoke-virtual {p0, p1, p2}, Lc/a/a/a/d0/f$c;->a(Lc/a/a/a/d0/f$l;I)V

    return-void
.end method

.method public b(Z)V
    .registers 2

    .line 10
    iput-boolean p1, p0, Lc/a/a/a/d0/f$c;->l:Z

    return-void
.end method

.method public c(I)I
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/d0/f$c;->j:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lc/a/a/a/d0/f$e;

    .line 2
    instance-of v0, p1, Lc/a/a/a/d0/f$f;

    if-eqz v0, :cond_e

    const/4 p1, 0x2

    return p1

    .line 3
    :cond_e
    instance-of v0, p1, Lc/a/a/a/d0/f$d;

    if-eqz v0, :cond_14

    const/4 p1, 0x3

    return p1

    .line 4
    :cond_14
    instance-of v0, p1, Lc/a/a/a/d0/f$g;

    if-eqz v0, :cond_28

    .line 5
    check-cast p1, Lc/a/a/a/d0/f$g;

    .line 6
    invoke-virtual {p1}, Lc/a/a/a/d0/f$g;->a()Lb/b/p/j/i;

    move-result-object p1

    invoke-virtual {p1}, Lb/b/p/j/i;->hasSubMenu()Z

    move-result p1

    if-eqz p1, :cond_26

    const/4 p1, 0x1

    return p1

    :cond_26
    const/4 p1, 0x0

    return p1

    .line 7
    :cond_28
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "Unknown item type."

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public bridge synthetic d(Landroidx/recyclerview/widget/RecyclerView$b0;)V
    .registers 2

    .line 1
    check-cast p1, Lc/a/a/a/d0/f$l;

    invoke-virtual {p0, p1}, Lc/a/a/a/d0/f$c;->a(Lc/a/a/a/d0/f$l;)V

    return-void
.end method

.method public g()Landroid/os/Bundle;
    .registers 8

    .line 1
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 2
    iget-object v1, p0, Lc/a/a/a/d0/f$c;->k:Lb/b/p/j/i;

    if-eqz v1, :cond_12

    .line 3
    invoke-virtual {v1}, Lb/b/p/j/i;->getItemId()I

    move-result v1

    const-string v2, "android:menu:checked"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 4
    :cond_12
    new-instance v1, Landroid/util/SparseArray;

    invoke-direct {v1}, Landroid/util/SparseArray;-><init>()V

    const/4 v2, 0x0

    .line 5
    iget-object v3, p0, Lc/a/a/a/d0/f$c;->j:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    :goto_1e
    if-ge v2, v3, :cond_4e

    .line 6
    iget-object v4, p0, Lc/a/a/a/d0/f$c;->j:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lc/a/a/a/d0/f$e;

    .line 7
    instance-of v5, v4, Lc/a/a/a/d0/f$g;

    if-eqz v5, :cond_4b

    .line 8
    check-cast v4, Lc/a/a/a/d0/f$g;

    invoke-virtual {v4}, Lc/a/a/a/d0/f$g;->a()Lb/b/p/j/i;

    move-result-object v4

    if-eqz v4, :cond_39

    .line 9
    invoke-virtual {v4}, Lb/b/p/j/i;->getActionView()Landroid/view/View;

    move-result-object v5

    goto :goto_3a

    :cond_39
    const/4 v5, 0x0

    :goto_3a
    if-eqz v5, :cond_4b

    .line 10
    new-instance v6, Lcom/google/android/material/internal/ParcelableSparseArray;

    invoke-direct {v6}, Lcom/google/android/material/internal/ParcelableSparseArray;-><init>()V

    .line 11
    invoke-virtual {v5, v6}, Landroid/view/View;->saveHierarchyState(Landroid/util/SparseArray;)V

    .line 12
    invoke-virtual {v4}, Lb/b/p/j/i;->getItemId()I

    move-result v4

    invoke-virtual {v1, v4, v6}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    :cond_4b
    add-int/lit8 v2, v2, 0x1

    goto :goto_1e

    :cond_4e
    const-string v2, "android:menu:action_views"

    .line 13
    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putSparseParcelableArray(Ljava/lang/String;Landroid/util/SparseArray;)V

    return-object v0
.end method

.method public h()Lb/b/p/j/i;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/d0/f$c;->k:Lb/b/p/j/i;

    return-object v0
.end method

.method public i()I
    .registers 4

    .line 1
    iget-object v0, p0, Lc/a/a/a/d0/f$c;->m:Lc/a/a/a/d0/f;

    iget-object v0, v0, Lc/a/a/a/d0/f;->i:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_d

    const/4 v0, 0x0

    goto :goto_e

    :cond_d
    const/4 v0, 0x1

    .line 2
    :goto_e
    iget-object v2, p0, Lc/a/a/a/d0/f$c;->m:Lc/a/a/a/d0/f;

    iget-object v2, v2, Lc/a/a/a/d0/f;->m:Lc/a/a/a/d0/f$c;

    invoke-virtual {v2}, Lc/a/a/a/d0/f$c;->b()I

    move-result v2

    if-ge v1, v2, :cond_27

    .line 3
    iget-object v2, p0, Lc/a/a/a/d0/f$c;->m:Lc/a/a/a/d0/f;

    iget-object v2, v2, Lc/a/a/a/d0/f;->m:Lc/a/a/a/d0/f$c;

    invoke-virtual {v2, v1}, Lc/a/a/a/d0/f$c;->c(I)I

    move-result v2

    if-nez v2, :cond_24

    add-int/lit8 v0, v0, 0x1

    :cond_24
    add-int/lit8 v1, v1, 0x1

    goto :goto_e

    :cond_27
    return v0
.end method

.method public final j()V
    .registers 17

    move-object/from16 v0, p0

    .line 1
    iget-boolean v1, v0, Lc/a/a/a/d0/f$c;->l:Z

    if-eqz v1, :cond_7

    return-void

    :cond_7
    const/4 v1, 0x1

    .line 2
    iput-boolean v1, v0, Lc/a/a/a/d0/f$c;->l:Z

    .line 3
    iget-object v2, v0, Lc/a/a/a/d0/f$c;->j:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 4
    iget-object v2, v0, Lc/a/a/a/d0/f$c;->j:Ljava/util/ArrayList;

    new-instance v3, Lc/a/a/a/d0/f$d;

    invoke-direct {v3}, Lc/a/a/a/d0/f$d;-><init>()V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v2, -0x1

    .line 5
    iget-object v3, v0, Lc/a/a/a/d0/f$c;->m:Lc/a/a/a/d0/f;

    iget-object v3, v3, Lc/a/a/a/d0/f;->k:Lb/b/p/j/g;

    invoke-virtual {v3}, Lb/b/p/j/g;->n()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    :goto_2a
    if-ge v5, v3, :cond_111

    .line 6
    iget-object v8, v0, Lc/a/a/a/d0/f$c;->m:Lc/a/a/a/d0/f;

    iget-object v8, v8, Lc/a/a/a/d0/f;->k:Lb/b/p/j/g;

    invoke-virtual {v8}, Lb/b/p/j/g;->n()Ljava/util/ArrayList;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lb/b/p/j/i;

    .line 7
    invoke-virtual {v8}, Lb/b/p/j/i;->isChecked()Z

    move-result v9

    if-eqz v9, :cond_43

    .line 8
    invoke-virtual {v0, v8}, Lc/a/a/a/d0/f$c;->a(Lb/b/p/j/i;)V

    .line 9
    :cond_43
    invoke-virtual {v8}, Lb/b/p/j/i;->isCheckable()Z

    move-result v9

    if-eqz v9, :cond_4c

    .line 10
    invoke-virtual {v8, v4}, Lb/b/p/j/i;->c(Z)V

    .line 11
    :cond_4c
    invoke-virtual {v8}, Lb/b/p/j/i;->hasSubMenu()Z

    move-result v9

    if-eqz v9, :cond_c5

    .line 12
    invoke-virtual {v8}, Lb/b/p/j/i;->getSubMenu()Landroid/view/SubMenu;

    move-result-object v9

    .line 13
    invoke-interface {v9}, Landroid/view/SubMenu;->hasVisibleItems()Z

    move-result v10

    if-eqz v10, :cond_10c

    if-eqz v5, :cond_6c

    .line 14
    iget-object v10, v0, Lc/a/a/a/d0/f$c;->j:Ljava/util/ArrayList;

    new-instance v11, Lc/a/a/a/d0/f$f;

    iget-object v12, v0, Lc/a/a/a/d0/f$c;->m:Lc/a/a/a/d0/f;

    iget v12, v12, Lc/a/a/a/d0/f;->A:I

    invoke-direct {v11, v12, v4}, Lc/a/a/a/d0/f$f;-><init>(II)V

    invoke-virtual {v10, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 15
    :cond_6c
    iget-object v10, v0, Lc/a/a/a/d0/f$c;->j:Ljava/util/ArrayList;

    new-instance v11, Lc/a/a/a/d0/f$g;

    invoke-direct {v11, v8}, Lc/a/a/a/d0/f$g;-><init>(Lb/b/p/j/i;)V

    invoke-virtual {v10, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 16
    iget-object v10, v0, Lc/a/a/a/d0/f$c;->j:Ljava/util/ArrayList;

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v10

    .line 17
    invoke-interface {v9}, Landroid/view/SubMenu;->size()I

    move-result v11

    const/4 v12, 0x0

    const/4 v13, 0x0

    :goto_82
    if-ge v12, v11, :cond_b9

    .line 18
    invoke-interface {v9, v12}, Landroid/view/SubMenu;->getItem(I)Landroid/view/MenuItem;

    move-result-object v14

    check-cast v14, Lb/b/p/j/i;

    .line 19
    invoke-virtual {v14}, Lb/b/p/j/i;->isVisible()Z

    move-result v15

    if-eqz v15, :cond_b5

    if-nez v13, :cond_99

    .line 20
    invoke-virtual {v14}, Lb/b/p/j/i;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v15

    if-eqz v15, :cond_99

    const/4 v13, 0x1

    .line 21
    :cond_99
    invoke-virtual {v14}, Lb/b/p/j/i;->isCheckable()Z

    move-result v15

    if-eqz v15, :cond_a2

    .line 22
    invoke-virtual {v14, v4}, Lb/b/p/j/i;->c(Z)V

    .line 23
    :cond_a2
    invoke-virtual {v8}, Lb/b/p/j/i;->isChecked()Z

    move-result v15

    if-eqz v15, :cond_ab

    .line 24
    invoke-virtual {v0, v8}, Lc/a/a/a/d0/f$c;->a(Lb/b/p/j/i;)V

    .line 25
    :cond_ab
    iget-object v15, v0, Lc/a/a/a/d0/f$c;->j:Ljava/util/ArrayList;

    new-instance v1, Lc/a/a/a/d0/f$g;

    invoke-direct {v1, v14}, Lc/a/a/a/d0/f$g;-><init>(Lb/b/p/j/i;)V

    invoke-virtual {v15, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_b5
    add-int/lit8 v12, v12, 0x1

    const/4 v1, 0x1

    goto :goto_82

    :cond_b9
    if-eqz v13, :cond_10c

    .line 26
    iget-object v1, v0, Lc/a/a/a/d0/f$c;->j:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-virtual {v0, v10, v1}, Lc/a/a/a/d0/f$c;->b(II)V

    goto :goto_10c

    .line 27
    :cond_c5
    invoke-virtual {v8}, Lb/b/p/j/i;->getGroupId()I

    move-result v1

    if-eq v1, v2, :cond_ed

    .line 28
    iget-object v2, v0, Lc/a/a/a/d0/f$c;->j:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v7

    .line 29
    invoke-virtual {v8}, Lb/b/p/j/i;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    if-eqz v2, :cond_d9

    const/4 v6, 0x1

    goto :goto_da

    :cond_d9
    const/4 v6, 0x0

    :goto_da
    if-eqz v5, :cond_ff

    add-int/lit8 v7, v7, 0x1

    .line 30
    iget-object v2, v0, Lc/a/a/a/d0/f$c;->j:Ljava/util/ArrayList;

    new-instance v9, Lc/a/a/a/d0/f$f;

    iget-object v10, v0, Lc/a/a/a/d0/f$c;->m:Lc/a/a/a/d0/f;

    iget v10, v10, Lc/a/a/a/d0/f;->A:I

    invoke-direct {v9, v10, v10}, Lc/a/a/a/d0/f$f;-><init>(II)V

    invoke-virtual {v2, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_ff

    :cond_ed
    if-nez v6, :cond_ff

    .line 31
    invoke-virtual {v8}, Lb/b/p/j/i;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    if-eqz v2, :cond_ff

    .line 32
    iget-object v2, v0, Lc/a/a/a/d0/f$c;->j:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual {v0, v7, v2}, Lc/a/a/a/d0/f$c;->b(II)V

    const/4 v6, 0x1

    .line 33
    :cond_ff
    :goto_ff
    new-instance v2, Lc/a/a/a/d0/f$g;

    invoke-direct {v2, v8}, Lc/a/a/a/d0/f$g;-><init>(Lb/b/p/j/i;)V

    .line 34
    iput-boolean v6, v2, Lc/a/a/a/d0/f$g;->b:Z

    .line 35
    iget-object v8, v0, Lc/a/a/a/d0/f$c;->j:Ljava/util/ArrayList;

    invoke-virtual {v8, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move v2, v1

    :cond_10c
    :goto_10c
    add-int/lit8 v5, v5, 0x1

    const/4 v1, 0x1

    goto/16 :goto_2a

    .line 36
    :cond_111
    iput-boolean v4, v0, Lc/a/a/a/d0/f$c;->l:Z

    return-void
.end method

.method public k()V
    .registers 1

    .line 1
    invoke-virtual {p0}, Lc/a/a/a/d0/f$c;->j()V

    .line 2
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$g;->f()V

    return-void
.end method
