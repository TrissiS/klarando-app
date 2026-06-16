.class public Landroidx/appcompat/widget/ActionMenuPresenter;
.super Lb/b/p/j/b;
.source "ActionMenuPresenter.java"

# interfaces
.implements Lb/h/m/b$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/appcompat/widget/ActionMenuPresenter$b;,
        Landroidx/appcompat/widget/ActionMenuPresenter$c;,
        Landroidx/appcompat/widget/ActionMenuPresenter$f;,
        Landroidx/appcompat/widget/ActionMenuPresenter$a;,
        Landroidx/appcompat/widget/ActionMenuPresenter$e;,
        Landroidx/appcompat/widget/ActionMenuPresenter$d;,
        Landroidx/appcompat/widget/ActionMenuPresenter$SavedState;
    }
.end annotation


# instance fields
.field public A:Z

.field public B:Z

.field public C:I

.field public final D:Landroid/util/SparseBooleanArray;

.field public E:Landroidx/appcompat/widget/ActionMenuPresenter$e;

.field public F:Landroidx/appcompat/widget/ActionMenuPresenter$a;

.field public G:Landroidx/appcompat/widget/ActionMenuPresenter$c;

.field public H:Landroidx/appcompat/widget/ActionMenuPresenter$b;

.field public final I:Landroidx/appcompat/widget/ActionMenuPresenter$f;

.field public J:I

.field public q:Landroidx/appcompat/widget/ActionMenuPresenter$d;

.field public r:Landroid/graphics/drawable/Drawable;

.field public s:Z

.field public t:Z

.field public u:Z

.field public v:I

.field public w:I

.field public x:I

.field public y:Z

.field public z:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4

    .line 1
    sget v0, Lb/b/g;->abc_action_menu_layout:I

    sget v1, Lb/b/g;->abc_action_menu_item_layout:I

    invoke-direct {p0, p1, v0, v1}, Lb/b/p/j/b;-><init>(Landroid/content/Context;II)V

    .line 2
    new-instance p1, Landroid/util/SparseBooleanArray;

    invoke-direct {p1}, Landroid/util/SparseBooleanArray;-><init>()V

    iput-object p1, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->D:Landroid/util/SparseBooleanArray;

    .line 3
    new-instance p1, Landroidx/appcompat/widget/ActionMenuPresenter$f;

    invoke-direct {p1, p0}, Landroidx/appcompat/widget/ActionMenuPresenter$f;-><init>(Landroidx/appcompat/widget/ActionMenuPresenter;)V

    iput-object p1, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->I:Landroidx/appcompat/widget/ActionMenuPresenter$f;

    return-void
.end method

.method public static synthetic a(Landroidx/appcompat/widget/ActionMenuPresenter;)Lb/b/p/j/g;
    .registers 1

    .line 1
    iget-object p0, p0, Lb/b/p/j/b;->j:Lb/b/p/j/g;

    return-object p0
.end method

.method public static synthetic b(Landroidx/appcompat/widget/ActionMenuPresenter;)Lb/b/p/j/g;
    .registers 1

    .line 1
    iget-object p0, p0, Lb/b/p/j/b;->j:Lb/b/p/j/g;

    return-object p0
.end method

.method public static synthetic c(Landroidx/appcompat/widget/ActionMenuPresenter;)Lb/b/p/j/n;
    .registers 1

    .line 1
    iget-object p0, p0, Lb/b/p/j/b;->o:Lb/b/p/j/n;

    return-object p0
.end method

.method public static synthetic d(Landroidx/appcompat/widget/ActionMenuPresenter;)Lb/b/p/j/g;
    .registers 1

    .line 1
    iget-object p0, p0, Lb/b/p/j/b;->j:Lb/b/p/j/g;

    return-object p0
.end method

.method public static synthetic e(Landroidx/appcompat/widget/ActionMenuPresenter;)Lb/b/p/j/g;
    .registers 1

    .line 1
    iget-object p0, p0, Lb/b/p/j/b;->j:Lb/b/p/j/g;

    return-object p0
.end method

.method public static synthetic f(Landroidx/appcompat/widget/ActionMenuPresenter;)Lb/b/p/j/g;
    .registers 1

    .line 1
    iget-object p0, p0, Lb/b/p/j/b;->j:Lb/b/p/j/g;

    return-object p0
.end method

.method public static synthetic g(Landroidx/appcompat/widget/ActionMenuPresenter;)Lb/b/p/j/n;
    .registers 1

    .line 1
    iget-object p0, p0, Lb/b/p/j/b;->o:Lb/b/p/j/n;

    return-object p0
.end method


# virtual methods
.method public final a(Landroid/view/MenuItem;)Landroid/view/View;
    .registers 8

    .line 85
    iget-object v0, p0, Lb/b/p/j/b;->o:Lb/b/p/j/n;

    check-cast v0, Landroid/view/ViewGroup;

    const/4 v1, 0x0

    if-nez v0, :cond_8

    return-object v1

    .line 86
    :cond_8
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    const/4 v3, 0x0

    :goto_d
    if-ge v3, v2, :cond_24

    .line 87
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 88
    instance-of v5, v4, Lb/b/p/j/n$a;

    if-eqz v5, :cond_21

    move-object v5, v4

    check-cast v5, Lb/b/p/j/n$a;

    .line 89
    invoke-interface {v5}, Lb/b/p/j/n$a;->getItemData()Lb/b/p/j/i;

    move-result-object v5

    if-ne v5, p1, :cond_21

    return-object v4

    :cond_21
    add-int/lit8 v3, v3, 0x1

    goto :goto_d

    :cond_24
    return-object v1
.end method

.method public a(Lb/b/p/j/i;Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 6

    .line 33
    invoke-virtual {p1}, Lb/b/p/j/i;->getActionView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_c

    .line 34
    invoke-virtual {p1}, Lb/b/p/j/i;->f()Z

    move-result v1

    if-eqz v1, :cond_10

    .line 35
    :cond_c
    invoke-super {p0, p1, p2, p3}, Lb/b/p/j/b;->a(Lb/b/p/j/i;Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 36
    :cond_10
    invoke-virtual {p1}, Lb/b/p/j/i;->isActionViewExpanded()Z

    move-result p1

    if-eqz p1, :cond_19

    const/16 p1, 0x8

    goto :goto_1a

    :cond_19
    const/4 p1, 0x0

    :goto_1a
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 37
    check-cast p3, Landroidx/appcompat/widget/ActionMenuView;

    .line 38
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    .line 39
    invoke-virtual {p3, p1}, Landroidx/appcompat/widget/ActionMenuView;->checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z

    move-result p2

    if-nez p2, :cond_30

    .line 40
    invoke-virtual {p3, p1}, Landroidx/appcompat/widget/ActionMenuView;->generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroidx/appcompat/widget/ActionMenuView$LayoutParams;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_30
    return-object v0
.end method

.method public a(Landroid/content/Context;Lb/b/p/j/g;)V
    .registers 7

    .line 2
    invoke-super {p0, p1, p2}, Lb/b/p/j/b;->a(Landroid/content/Context;Lb/b/p/j/g;)V

    .line 3
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    .line 4
    invoke-static {p1}, Lb/b/p/a;->a(Landroid/content/Context;)Lb/b/p/a;

    move-result-object p1

    .line 5
    iget-boolean v0, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->u:Z

    if-nez v0, :cond_15

    .line 6
    invoke-virtual {p1}, Lb/b/p/a;->g()Z

    move-result v0

    iput-boolean v0, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->t:Z

    .line 7
    :cond_15
    iget-boolean v0, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->A:Z

    if-nez v0, :cond_1f

    .line 8
    invoke-virtual {p1}, Lb/b/p/a;->b()I

    move-result v0

    iput v0, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->v:I

    .line 9
    :cond_1f
    iget-boolean v0, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->y:Z

    if-nez v0, :cond_29

    .line 10
    invoke-virtual {p1}, Lb/b/p/a;->c()I

    move-result p1

    iput p1, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->x:I

    .line 11
    :cond_29
    iget p1, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->v:I

    .line 12
    iget-boolean v0, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->t:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_5c

    .line 13
    iget-object v0, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->q:Landroidx/appcompat/widget/ActionMenuPresenter$d;

    if-nez v0, :cond_54

    .line 14
    new-instance v0, Landroidx/appcompat/widget/ActionMenuPresenter$d;

    iget-object v2, p0, Lb/b/p/j/b;->h:Landroid/content/Context;

    invoke-direct {v0, p0, v2}, Landroidx/appcompat/widget/ActionMenuPresenter$d;-><init>(Landroidx/appcompat/widget/ActionMenuPresenter;Landroid/content/Context;)V

    iput-object v0, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->q:Landroidx/appcompat/widget/ActionMenuPresenter$d;

    .line 15
    iget-boolean v2, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->s:Z

    const/4 v3, 0x0

    if-eqz v2, :cond_4b

    .line 16
    iget-object v2, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->r:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 17
    iput-object v1, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->r:Landroid/graphics/drawable/Drawable;

    .line 18
    iput-boolean v3, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->s:Z

    .line 19
    :cond_4b
    invoke-static {v3, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    .line 20
    iget-object v1, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->q:Landroidx/appcompat/widget/ActionMenuPresenter$d;

    invoke-virtual {v1, v0, v0}, Landroid/widget/ImageView;->measure(II)V

    .line 21
    :cond_54
    iget-object v0, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->q:Landroidx/appcompat/widget/ActionMenuPresenter$d;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getMeasuredWidth()I

    move-result v0

    sub-int/2addr p1, v0

    goto :goto_5e

    .line 22
    :cond_5c
    iput-object v1, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->q:Landroidx/appcompat/widget/ActionMenuPresenter$d;

    .line 23
    :goto_5e
    iput p1, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->w:I

    const/high16 p1, 0x42600000    # 56.0f

    .line 24
    invoke-virtual {p2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p2

    iget p2, p2, Landroid/util/DisplayMetrics;->density:F

    mul-float p2, p2, p1

    float-to-int p1, p2

    iput p1, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->C:I

    return-void
.end method

.method public a(Landroid/content/res/Configuration;)V
    .registers 3

    .line 25
    iget-boolean p1, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->y:Z

    if-nez p1, :cond_10

    .line 26
    iget-object p1, p0, Lb/b/p/j/b;->i:Landroid/content/Context;

    invoke-static {p1}, Lb/b/p/a;->a(Landroid/content/Context;)Lb/b/p/a;

    move-result-object p1

    invoke-virtual {p1}, Lb/b/p/a;->c()I

    move-result p1

    iput p1, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->x:I

    .line 27
    :cond_10
    iget-object p1, p0, Lb/b/p/j/b;->j:Lb/b/p/j/g;

    if-eqz p1, :cond_18

    const/4 v0, 0x1

    .line 28
    invoke-virtual {p1, v0}, Lb/b/p/j/g;->c(Z)V

    :cond_18
    return-void
.end method

.method public a(Landroid/graphics/drawable/Drawable;)V
    .registers 3

    .line 29
    iget-object v0, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->q:Landroidx/appcompat/widget/ActionMenuPresenter$d;

    if-eqz v0, :cond_8

    .line 30
    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_d

    :cond_8
    const/4 v0, 0x1

    .line 31
    iput-boolean v0, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->s:Z

    .line 32
    iput-object p1, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->r:Landroid/graphics/drawable/Drawable;

    :goto_d
    return-void
.end method

.method public a(Landroid/os/Parcelable;)V
    .registers 3

    .line 92
    instance-of v0, p1, Landroidx/appcompat/widget/ActionMenuPresenter$SavedState;

    if-nez v0, :cond_5

    return-void

    .line 93
    :cond_5
    check-cast p1, Landroidx/appcompat/widget/ActionMenuPresenter$SavedState;

    .line 94
    iget p1, p1, Landroidx/appcompat/widget/ActionMenuPresenter$SavedState;->h:I

    if-lez p1, :cond_1c

    .line 95
    iget-object v0, p0, Lb/b/p/j/b;->j:Lb/b/p/j/g;

    invoke-virtual {v0, p1}, Lb/b/p/j/g;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    if-eqz p1, :cond_1c

    .line 96
    invoke-interface {p1}, Landroid/view/MenuItem;->getSubMenu()Landroid/view/SubMenu;

    move-result-object p1

    check-cast p1, Lb/b/p/j/r;

    .line 97
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/ActionMenuPresenter;->a(Lb/b/p/j/r;)Z

    :cond_1c
    return-void
.end method

.method public a(Landroidx/appcompat/widget/ActionMenuView;)V
    .registers 3

    .line 98
    iput-object p1, p0, Lb/b/p/j/b;->o:Lb/b/p/j/n;

    .line 99
    iget-object v0, p0, Lb/b/p/j/b;->j:Lb/b/p/j/g;

    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/ActionMenuView;->a(Lb/b/p/j/g;)V

    return-void
.end method

.method public a(Lb/b/p/j/g;Z)V
    .registers 3

    .line 90
    invoke-virtual {p0}, Landroidx/appcompat/widget/ActionMenuPresenter;->e()Z

    .line 91
    invoke-super {p0, p1, p2}, Lb/b/p/j/b;->a(Lb/b/p/j/g;Z)V

    return-void
.end method

.method public a(Lb/b/p/j/i;Lb/b/p/j/n$a;)V
    .registers 4

    const/4 v0, 0x0

    .line 41
    invoke-interface {p2, p1, v0}, Lb/b/p/j/n$a;->a(Lb/b/p/j/i;I)V

    .line 42
    iget-object p1, p0, Lb/b/p/j/b;->o:Lb/b/p/j/n;

    check-cast p1, Landroidx/appcompat/widget/ActionMenuView;

    .line 43
    check-cast p2, Landroidx/appcompat/view/menu/ActionMenuItemView;

    .line 44
    invoke-virtual {p2, p1}, Landroidx/appcompat/view/menu/ActionMenuItemView;->setItemInvoker(Lb/b/p/j/g$b;)V

    .line 45
    iget-object p1, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->H:Landroidx/appcompat/widget/ActionMenuPresenter$b;

    if-nez p1, :cond_18

    .line 46
    new-instance p1, Landroidx/appcompat/widget/ActionMenuPresenter$b;

    invoke-direct {p1, p0}, Landroidx/appcompat/widget/ActionMenuPresenter$b;-><init>(Landroidx/appcompat/widget/ActionMenuPresenter;)V

    iput-object p1, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->H:Landroidx/appcompat/widget/ActionMenuPresenter$b;

    .line 47
    :cond_18
    iget-object p1, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->H:Landroidx/appcompat/widget/ActionMenuPresenter$b;

    invoke-virtual {p2, p1}, Landroidx/appcompat/view/menu/ActionMenuItemView;->setPopupCallback(Landroidx/appcompat/view/menu/ActionMenuItemView$b;)V

    return-void
.end method

.method public a(Z)V
    .registers 6

    .line 49
    invoke-super {p0, p1}, Lb/b/p/j/b;->a(Z)V

    .line 50
    iget-object p1, p0, Lb/b/p/j/b;->o:Lb/b/p/j/n;

    check-cast p1, Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->requestLayout()V

    .line 51
    iget-object p1, p0, Lb/b/p/j/b;->j:Lb/b/p/j/g;

    const/4 v0, 0x0

    if-eqz p1, :cond_2c

    .line 52
    invoke-virtual {p1}, Lb/b/p/j/g;->c()Ljava/util/ArrayList;

    move-result-object p1

    .line 53
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_18
    if-ge v2, v1, :cond_2c

    .line 54
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lb/b/p/j/i;

    invoke-virtual {v3}, Lb/b/p/j/i;->a()Lb/h/m/b;

    move-result-object v3

    if-eqz v3, :cond_29

    .line 55
    invoke-virtual {v3, p0}, Lb/h/m/b;->a(Lb/h/m/b$a;)V

    :cond_29
    add-int/lit8 v2, v2, 0x1

    goto :goto_18

    .line 56
    :cond_2c
    iget-object p1, p0, Lb/b/p/j/b;->j:Lb/b/p/j/g;

    if-eqz p1, :cond_35

    .line 57
    invoke-virtual {p1}, Lb/b/p/j/g;->j()Ljava/util/ArrayList;

    move-result-object p1

    goto :goto_36

    :cond_35
    const/4 p1, 0x0

    .line 58
    :goto_36
    iget-boolean v1, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->t:Z

    if-eqz v1, :cond_53

    if-eqz p1, :cond_53

    .line 59
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_50

    .line 60
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lb/b/p/j/i;

    invoke-virtual {p1}, Lb/b/p/j/i;->isActionViewExpanded()Z

    move-result p1

    xor-int/lit8 v0, p1, 0x1

    goto :goto_53

    :cond_50
    if-lez v1, :cond_53

    const/4 v0, 0x1

    :cond_53
    :goto_53
    if-eqz v0, :cond_83

    .line 61
    iget-object p1, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->q:Landroidx/appcompat/widget/ActionMenuPresenter$d;

    if-nez p1, :cond_62

    .line 62
    new-instance p1, Landroidx/appcompat/widget/ActionMenuPresenter$d;

    iget-object v0, p0, Lb/b/p/j/b;->h:Landroid/content/Context;

    invoke-direct {p1, p0, v0}, Landroidx/appcompat/widget/ActionMenuPresenter$d;-><init>(Landroidx/appcompat/widget/ActionMenuPresenter;Landroid/content/Context;)V

    iput-object p1, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->q:Landroidx/appcompat/widget/ActionMenuPresenter$d;

    .line 63
    :cond_62
    iget-object p1, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->q:Landroidx/appcompat/widget/ActionMenuPresenter$d;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup;

    .line 64
    iget-object v0, p0, Lb/b/p/j/b;->o:Lb/b/p/j/n;

    if-eq p1, v0, :cond_96

    if-eqz p1, :cond_75

    .line 65
    iget-object v0, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->q:Landroidx/appcompat/widget/ActionMenuPresenter$d;

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 66
    :cond_75
    iget-object p1, p0, Lb/b/p/j/b;->o:Lb/b/p/j/n;

    check-cast p1, Landroidx/appcompat/widget/ActionMenuView;

    .line 67
    iget-object v0, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->q:Landroidx/appcompat/widget/ActionMenuPresenter$d;

    invoke-virtual {p1}, Landroidx/appcompat/widget/ActionMenuView;->e()Landroidx/appcompat/widget/ActionMenuView$LayoutParams;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_96

    .line 68
    :cond_83
    iget-object p1, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->q:Landroidx/appcompat/widget/ActionMenuPresenter$d;

    if-eqz p1, :cond_96

    invoke-virtual {p1}, Landroid/widget/ImageView;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    iget-object v0, p0, Lb/b/p/j/b;->o:Lb/b/p/j/n;

    if-ne p1, v0, :cond_96

    .line 69
    check-cast v0, Landroid/view/ViewGroup;

    iget-object p1, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->q:Landroidx/appcompat/widget/ActionMenuPresenter$d;

    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 70
    :cond_96
    :goto_96
    iget-object p1, p0, Lb/b/p/j/b;->o:Lb/b/p/j/n;

    check-cast p1, Landroidx/appcompat/widget/ActionMenuView;

    iget-boolean v0, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->t:Z

    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/ActionMenuView;->setOverflowReserved(Z)V

    return-void
.end method

.method public a(ILb/b/p/j/i;)Z
    .registers 3

    .line 48
    invoke-virtual {p2}, Lb/b/p/j/i;->h()Z

    move-result p1

    return p1
.end method

.method public a(Landroid/view/ViewGroup;I)Z
    .registers 5

    .line 71
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->q:Landroidx/appcompat/widget/ActionMenuPresenter$d;

    if-ne v0, v1, :cond_a

    const/4 p1, 0x0

    return p1

    .line 72
    :cond_a
    invoke-super {p0, p1, p2}, Lb/b/p/j/b;->a(Landroid/view/ViewGroup;I)Z

    move-result p1

    return p1
.end method

.method public a(Lb/b/p/j/r;)Z
    .registers 9

    .line 73
    invoke-virtual {p1}, Lb/b/p/j/g;->hasVisibleItems()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_8

    return v1

    :cond_8
    move-object v0, p1

    .line 74
    :goto_9
    invoke-virtual {v0}, Lb/b/p/j/r;->t()Landroid/view/Menu;

    move-result-object v2

    iget-object v3, p0, Lb/b/p/j/b;->j:Lb/b/p/j/g;

    if-eq v2, v3, :cond_18

    .line 75
    invoke-virtual {v0}, Lb/b/p/j/r;->t()Landroid/view/Menu;

    move-result-object v0

    check-cast v0, Lb/b/p/j/r;

    goto :goto_9

    .line 76
    :cond_18
    invoke-virtual {v0}, Lb/b/p/j/r;->getItem()Landroid/view/MenuItem;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/ActionMenuPresenter;->a(Landroid/view/MenuItem;)Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_23

    return v1

    .line 77
    :cond_23
    invoke-virtual {p1}, Lb/b/p/j/r;->getItem()Landroid/view/MenuItem;

    move-result-object v2

    invoke-interface {v2}, Landroid/view/MenuItem;->getItemId()I

    move-result v2

    iput v2, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->J:I

    .line 78
    invoke-virtual {p1}, Lb/b/p/j/g;->size()I

    move-result v2

    const/4 v3, 0x0

    :goto_32
    const/4 v4, 0x1

    if-ge v3, v2, :cond_4a

    .line 79
    invoke-virtual {p1, v3}, Lb/b/p/j/g;->getItem(I)Landroid/view/MenuItem;

    move-result-object v5

    .line 80
    invoke-interface {v5}, Landroid/view/MenuItem;->isVisible()Z

    move-result v6

    if-eqz v6, :cond_47

    invoke-interface {v5}, Landroid/view/MenuItem;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v5

    if-eqz v5, :cond_47

    const/4 v1, 0x1

    goto :goto_4a

    :cond_47
    add-int/lit8 v3, v3, 0x1

    goto :goto_32

    .line 81
    :cond_4a
    :goto_4a
    new-instance v2, Landroidx/appcompat/widget/ActionMenuPresenter$a;

    iget-object v3, p0, Lb/b/p/j/b;->i:Landroid/content/Context;

    invoke-direct {v2, p0, v3, p1, v0}, Landroidx/appcompat/widget/ActionMenuPresenter$a;-><init>(Landroidx/appcompat/widget/ActionMenuPresenter;Landroid/content/Context;Lb/b/p/j/r;Landroid/view/View;)V

    iput-object v2, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->F:Landroidx/appcompat/widget/ActionMenuPresenter$a;

    .line 82
    invoke-virtual {v2, v1}, Lb/b/p/j/l;->a(Z)V

    .line 83
    iget-object v0, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->F:Landroidx/appcompat/widget/ActionMenuPresenter$a;

    invoke-virtual {v0}, Lb/b/p/j/l;->f()V

    .line 84
    invoke-super {p0, p1}, Lb/b/p/j/b;->a(Lb/b/p/j/r;)Z

    return v4
.end method

.method public b(Landroid/view/ViewGroup;)Lb/b/p/j/n;
    .registers 3

    .line 2
    iget-object v0, p0, Lb/b/p/j/b;->o:Lb/b/p/j/n;

    .line 3
    invoke-super {p0, p1}, Lb/b/p/j/b;->b(Landroid/view/ViewGroup;)Lb/b/p/j/n;

    move-result-object p1

    if-eq v0, p1, :cond_e

    .line 4
    move-object v0, p1

    check-cast v0, Landroidx/appcompat/widget/ActionMenuView;

    invoke-virtual {v0, p0}, Landroidx/appcompat/widget/ActionMenuView;->setPresenter(Landroidx/appcompat/widget/ActionMenuPresenter;)V

    :cond_e
    return-object p1
.end method

.method public b(Z)V
    .registers 3

    if-eqz p1, :cond_7

    const/4 p1, 0x0

    .line 5
    invoke-super {p0, p1}, Lb/b/p/j/b;->a(Lb/b/p/j/r;)Z

    goto :goto_f

    .line 6
    :cond_7
    iget-object p1, p0, Lb/b/p/j/b;->j:Lb/b/p/j/g;

    if-eqz p1, :cond_f

    const/4 v0, 0x0

    .line 7
    invoke-virtual {p1, v0}, Lb/b/p/j/g;->a(Z)V

    :cond_f
    :goto_f
    return-void
.end method

.method public c(Z)V
    .registers 2

    .line 2
    iput-boolean p1, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->B:Z

    return-void
.end method

.method public c()Z
    .registers 21

    move-object/from16 v0, p0

    .line 3
    iget-object v1, v0, Lb/b/p/j/b;->j:Lb/b/p/j/g;

    const/4 v2, 0x0

    const/4 v3, 0x0

    if-eqz v1, :cond_11

    .line 4
    invoke-virtual {v1}, Lb/b/p/j/g;->n()Ljava/util/ArrayList;

    move-result-object v1

    .line 5
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    goto :goto_13

    :cond_11
    move-object v1, v2

    const/4 v4, 0x0

    .line 6
    :goto_13
    iget v5, v0, Landroidx/appcompat/widget/ActionMenuPresenter;->x:I

    .line 7
    iget v6, v0, Landroidx/appcompat/widget/ActionMenuPresenter;->w:I

    .line 8
    invoke-static {v3, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v7

    .line 9
    iget-object v8, v0, Lb/b/p/j/b;->o:Lb/b/p/j/n;

    check-cast v8, Landroid/view/ViewGroup;

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    :goto_23
    if-ge v9, v4, :cond_4c

    .line 10
    invoke-virtual {v1, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lb/b/p/j/i;

    .line 11
    invoke-virtual {v14}, Lb/b/p/j/i;->k()Z

    move-result v15

    if-eqz v15, :cond_34

    add-int/lit8 v11, v11, 0x1

    goto :goto_3e

    .line 12
    :cond_34
    invoke-virtual {v14}, Lb/b/p/j/i;->j()Z

    move-result v15

    if-eqz v15, :cond_3d

    add-int/lit8 v12, v12, 0x1

    goto :goto_3e

    :cond_3d
    const/4 v10, 0x1

    .line 13
    :goto_3e
    iget-boolean v13, v0, Landroidx/appcompat/widget/ActionMenuPresenter;->B:Z

    if-eqz v13, :cond_49

    invoke-virtual {v14}, Lb/b/p/j/i;->isActionViewExpanded()Z

    move-result v13

    if-eqz v13, :cond_49

    const/4 v5, 0x0

    :cond_49
    add-int/lit8 v9, v9, 0x1

    goto :goto_23

    .line 14
    :cond_4c
    iget-boolean v9, v0, Landroidx/appcompat/widget/ActionMenuPresenter;->t:Z

    if-eqz v9, :cond_57

    if-nez v10, :cond_55

    add-int/2addr v12, v11

    if-le v12, v5, :cond_57

    :cond_55
    add-int/lit8 v5, v5, -0x1

    :cond_57
    sub-int/2addr v5, v11

    .line 15
    iget-object v9, v0, Landroidx/appcompat/widget/ActionMenuPresenter;->D:Landroid/util/SparseBooleanArray;

    .line 16
    invoke-virtual {v9}, Landroid/util/SparseBooleanArray;->clear()V

    .line 17
    iget-boolean v10, v0, Landroidx/appcompat/widget/ActionMenuPresenter;->z:Z

    if-eqz v10, :cond_6a

    .line 18
    iget v10, v0, Landroidx/appcompat/widget/ActionMenuPresenter;->C:I

    div-int v11, v6, v10

    .line 19
    rem-int v12, v6, v10

    .line 20
    div-int/2addr v12, v11

    add-int/2addr v10, v12

    goto :goto_6c

    :cond_6a
    const/4 v10, 0x0

    const/4 v11, 0x0

    :goto_6c
    const/4 v12, 0x0

    const/4 v14, 0x0

    :goto_6e
    if-ge v12, v4, :cond_143

    .line 21
    invoke-virtual {v1, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lb/b/p/j/i;

    .line 22
    invoke-virtual {v15}, Lb/b/p/j/i;->k()Z

    move-result v16

    if-eqz v16, :cond_a7

    .line 23
    invoke-virtual {v0, v15, v2, v8}, Landroidx/appcompat/widget/ActionMenuPresenter;->a(Lb/b/p/j/i;Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v13

    .line 24
    iget-boolean v2, v0, Landroidx/appcompat/widget/ActionMenuPresenter;->z:Z

    if-eqz v2, :cond_8a

    .line 25
    invoke-static {v13, v10, v11, v7, v3}, Landroidx/appcompat/widget/ActionMenuView;->b(Landroid/view/View;IIII)I

    move-result v2

    sub-int/2addr v11, v2

    goto :goto_8d

    .line 26
    :cond_8a
    invoke-virtual {v13, v7, v7}, Landroid/view/View;->measure(II)V

    .line 27
    :goto_8d
    invoke-virtual {v13}, Landroid/view/View;->getMeasuredWidth()I

    move-result v2

    sub-int/2addr v6, v2

    if-nez v14, :cond_95

    move v14, v2

    .line 28
    :cond_95
    invoke-virtual {v15}, Lb/b/p/j/i;->getGroupId()I

    move-result v2

    const/4 v13, 0x1

    if-eqz v2, :cond_9f

    .line 29
    invoke-virtual {v9, v2, v13}, Landroid/util/SparseBooleanArray;->put(IZ)V

    .line 30
    :cond_9f
    invoke-virtual {v15, v13}, Lb/b/p/j/i;->d(Z)V

    move/from16 v17, v4

    :goto_a4
    const/4 v0, 0x0

    goto/16 :goto_139

    .line 31
    :cond_a7
    invoke-virtual {v15}, Lb/b/p/j/i;->j()Z

    move-result v2

    if-eqz v2, :cond_133

    .line 32
    invoke-virtual {v15}, Lb/b/p/j/i;->getGroupId()I

    move-result v2

    .line 33
    invoke-virtual {v9, v2}, Landroid/util/SparseBooleanArray;->get(I)Z

    move-result v13

    if-gtz v5, :cond_b9

    if-eqz v13, :cond_c3

    :cond_b9
    if-lez v6, :cond_c3

    .line 34
    iget-boolean v3, v0, Landroidx/appcompat/widget/ActionMenuPresenter;->z:Z

    if-eqz v3, :cond_c1

    if-lez v11, :cond_c3

    :cond_c1
    const/4 v3, 0x1

    goto :goto_c4

    :cond_c3
    const/4 v3, 0x0

    :goto_c4
    move/from16 v18, v3

    move/from16 v17, v4

    if-eqz v3, :cond_fb

    const/4 v3, 0x0

    .line 35
    invoke-virtual {v0, v15, v3, v8}, Landroidx/appcompat/widget/ActionMenuPresenter;->a(Lb/b/p/j/i;Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v4

    .line 36
    iget-boolean v3, v0, Landroidx/appcompat/widget/ActionMenuPresenter;->z:Z

    if-eqz v3, :cond_df

    const/4 v3, 0x0

    .line 37
    invoke-static {v4, v10, v11, v7, v3}, Landroidx/appcompat/widget/ActionMenuView;->b(Landroid/view/View;IIII)I

    move-result v19

    sub-int v11, v11, v19

    if-nez v19, :cond_e2

    const/16 v18, 0x0

    goto :goto_e2

    .line 38
    :cond_df
    invoke-virtual {v4, v7, v7}, Landroid/view/View;->measure(II)V

    :cond_e2
    :goto_e2
    move/from16 v3, v18

    .line 39
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredWidth()I

    move-result v4

    sub-int/2addr v6, v4

    if-nez v14, :cond_ec

    move v14, v4

    .line 40
    :cond_ec
    iget-boolean v4, v0, Landroidx/appcompat/widget/ActionMenuPresenter;->z:Z

    if-eqz v4, :cond_f3

    if-ltz v6, :cond_f9

    goto :goto_f7

    :cond_f3
    add-int v4, v6, v14

    if-lez v4, :cond_f9

    :goto_f7
    const/4 v4, 0x1

    goto :goto_fa

    :cond_f9
    const/4 v4, 0x0

    :goto_fa
    and-int/2addr v3, v4

    :cond_fb
    if-eqz v3, :cond_104

    if-eqz v2, :cond_104

    const/4 v4, 0x1

    .line 41
    invoke-virtual {v9, v2, v4}, Landroid/util/SparseBooleanArray;->put(IZ)V

    goto :goto_12a

    :cond_104
    if-eqz v13, :cond_12a

    const/4 v4, 0x0

    .line 42
    invoke-virtual {v9, v2, v4}, Landroid/util/SparseBooleanArray;->put(IZ)V

    const/4 v4, 0x0

    :goto_10b
    if-ge v4, v12, :cond_12a

    .line 43
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lb/b/p/j/i;

    .line 44
    invoke-virtual {v13}, Lb/b/p/j/i;->getGroupId()I

    move-result v0

    if-ne v0, v2, :cond_125

    .line 45
    invoke-virtual {v13}, Lb/b/p/j/i;->h()Z

    move-result v0

    if-eqz v0, :cond_121

    add-int/lit8 v5, v5, 0x1

    :cond_121
    const/4 v0, 0x0

    .line 46
    invoke-virtual {v13, v0}, Lb/b/p/j/i;->d(Z)V

    :cond_125
    add-int/lit8 v4, v4, 0x1

    move-object/from16 v0, p0

    goto :goto_10b

    :cond_12a
    :goto_12a
    if-eqz v3, :cond_12e

    add-int/lit8 v5, v5, -0x1

    .line 47
    :cond_12e
    invoke-virtual {v15, v3}, Lb/b/p/j/i;->d(Z)V

    goto/16 :goto_a4

    :cond_133
    move/from16 v17, v4

    const/4 v0, 0x0

    .line 48
    invoke-virtual {v15, v0}, Lb/b/p/j/i;->d(Z)V

    :goto_139
    add-int/lit8 v12, v12, 0x1

    move/from16 v4, v17

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object/from16 v0, p0

    goto/16 :goto_6e

    :cond_143
    const/4 v2, 0x1

    return v2
.end method

.method public d()Landroid/os/Parcelable;
    .registers 3

    .line 4
    new-instance v0, Landroidx/appcompat/widget/ActionMenuPresenter$SavedState;

    invoke-direct {v0}, Landroidx/appcompat/widget/ActionMenuPresenter$SavedState;-><init>()V

    .line 5
    iget v1, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->J:I

    iput v1, v0, Landroidx/appcompat/widget/ActionMenuPresenter$SavedState;->h:I

    return-object v0
.end method

.method public d(Z)V
    .registers 2

    .line 2
    iput-boolean p1, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->t:Z

    const/4 p1, 0x1

    .line 3
    iput-boolean p1, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->u:Z

    return-void
.end method

.method public e()Z
    .registers 3

    .line 2
    invoke-virtual {p0}, Landroidx/appcompat/widget/ActionMenuPresenter;->g()Z

    move-result v0

    .line 3
    invoke-virtual {p0}, Landroidx/appcompat/widget/ActionMenuPresenter;->h()Z

    move-result v1

    or-int/2addr v0, v1

    return v0
.end method

.method public f()Landroid/graphics/drawable/Drawable;
    .registers 2

    .line 2
    iget-object v0, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->q:Landroidx/appcompat/widget/ActionMenuPresenter$d;

    if-eqz v0, :cond_9

    .line 3
    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0

    .line 4
    :cond_9
    iget-boolean v0, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->s:Z

    if-eqz v0, :cond_10

    .line 5
    iget-object v0, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->r:Landroid/graphics/drawable/Drawable;

    return-object v0

    :cond_10
    const/4 v0, 0x0

    return-object v0
.end method

.method public g()Z
    .registers 4

    .line 2
    iget-object v0, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->G:Landroidx/appcompat/widget/ActionMenuPresenter$c;

    const/4 v1, 0x1

    if-eqz v0, :cond_12

    iget-object v2, p0, Lb/b/p/j/b;->o:Lb/b/p/j/n;

    if-eqz v2, :cond_12

    .line 3
    check-cast v2, Landroid/view/View;

    invoke-virtual {v2, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    const/4 v0, 0x0

    .line 4
    iput-object v0, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->G:Landroidx/appcompat/widget/ActionMenuPresenter$c;

    return v1

    .line 5
    :cond_12
    iget-object v0, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->E:Landroidx/appcompat/widget/ActionMenuPresenter$e;

    if-eqz v0, :cond_1a

    .line 6
    invoke-virtual {v0}, Lb/b/p/j/l;->b()V

    return v1

    :cond_1a
    const/4 v0, 0x0

    return v0
.end method

.method public h()Z
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->F:Landroidx/appcompat/widget/ActionMenuPresenter$a;

    if-eqz v0, :cond_9

    .line 2
    invoke-virtual {v0}, Lb/b/p/j/l;->b()V

    const/4 v0, 0x1

    return v0

    :cond_9
    const/4 v0, 0x0

    return v0
.end method

.method public i()Z
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->G:Landroidx/appcompat/widget/ActionMenuPresenter$c;

    if-nez v0, :cond_d

    invoke-virtual {p0}, Landroidx/appcompat/widget/ActionMenuPresenter;->j()Z

    move-result v0

    if-eqz v0, :cond_b

    goto :goto_d

    :cond_b
    const/4 v0, 0x0

    goto :goto_e

    :cond_d
    :goto_d
    const/4 v0, 0x1

    :goto_e
    return v0
.end method

.method public j()Z
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->E:Landroidx/appcompat/widget/ActionMenuPresenter$e;

    if-eqz v0, :cond_c

    invoke-virtual {v0}, Lb/b/p/j/l;->d()Z

    move-result v0

    if-eqz v0, :cond_c

    const/4 v0, 0x1

    goto :goto_d

    :cond_c
    const/4 v0, 0x0

    :goto_d
    return v0
.end method

.method public k()Z
    .registers 8

    .line 1
    iget-boolean v0, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->t:Z

    if-eqz v0, :cond_3e

    invoke-virtual {p0}, Landroidx/appcompat/widget/ActionMenuPresenter;->j()Z

    move-result v0

    if-nez v0, :cond_3e

    iget-object v0, p0, Lb/b/p/j/b;->j:Lb/b/p/j/g;

    if-eqz v0, :cond_3e

    iget-object v1, p0, Lb/b/p/j/b;->o:Lb/b/p/j/n;

    if-eqz v1, :cond_3e

    iget-object v1, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->G:Landroidx/appcompat/widget/ActionMenuPresenter$c;

    if-nez v1, :cond_3e

    .line 2
    invoke-virtual {v0}, Lb/b/p/j/g;->j()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3e

    .line 3
    new-instance v0, Landroidx/appcompat/widget/ActionMenuPresenter$e;

    iget-object v3, p0, Lb/b/p/j/b;->i:Landroid/content/Context;

    iget-object v4, p0, Lb/b/p/j/b;->j:Lb/b/p/j/g;

    iget-object v5, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->q:Landroidx/appcompat/widget/ActionMenuPresenter$d;

    const/4 v6, 0x1

    move-object v1, v0

    move-object v2, p0

    invoke-direct/range {v1 .. v6}, Landroidx/appcompat/widget/ActionMenuPresenter$e;-><init>(Landroidx/appcompat/widget/ActionMenuPresenter;Landroid/content/Context;Lb/b/p/j/g;Landroid/view/View;Z)V

    .line 4
    new-instance v1, Landroidx/appcompat/widget/ActionMenuPresenter$c;

    invoke-direct {v1, p0, v0}, Landroidx/appcompat/widget/ActionMenuPresenter$c;-><init>(Landroidx/appcompat/widget/ActionMenuPresenter;Landroidx/appcompat/widget/ActionMenuPresenter$e;)V

    iput-object v1, p0, Landroidx/appcompat/widget/ActionMenuPresenter;->G:Landroidx/appcompat/widget/ActionMenuPresenter$c;

    .line 5
    iget-object v0, p0, Lb/b/p/j/b;->o:Lb/b/p/j/n;

    check-cast v0, Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    const/4 v0, 0x1

    return v0

    :cond_3e
    const/4 v0, 0x0

    return v0
.end method
