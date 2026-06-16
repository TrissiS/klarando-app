.class public Landroidx/appcompat/app/AlertController;
.super Ljava/lang/Object;
.source "AlertController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/appcompat/app/AlertController$h;,
        Landroidx/appcompat/app/AlertController$f;,
        Landroidx/appcompat/app/AlertController$RecycleListView;,
        Landroidx/appcompat/app/AlertController$g;
    }
.end annotation


# instance fields
.field public A:Landroidx/core/widget/NestedScrollView;

.field public B:I

.field public C:Landroid/graphics/drawable/Drawable;

.field public D:Landroid/widget/ImageView;

.field public E:Landroid/widget/TextView;

.field public F:Landroid/widget/TextView;

.field public G:Landroid/view/View;

.field public H:Landroid/widget/ListAdapter;

.field public I:I

.field public J:I

.field public K:I

.field public L:I

.field public M:I

.field public N:I

.field public O:I

.field public P:Z

.field public Q:I

.field public R:Landroid/os/Handler;

.field public final S:Landroid/view/View$OnClickListener;

.field public final a:Landroid/content/Context;

.field public final b:Lb/b/k/d;

.field public final c:Landroid/view/Window;

.field public final d:I

.field public e:Ljava/lang/CharSequence;

.field public f:Ljava/lang/CharSequence;

.field public g:Landroid/widget/ListView;

.field public h:Landroid/view/View;

.field public i:I

.field public j:I

.field public k:I

.field public l:I

.field public m:I

.field public n:Z

.field public o:Landroid/widget/Button;

.field public p:Ljava/lang/CharSequence;

.field public q:Landroid/os/Message;

.field public r:Landroid/graphics/drawable/Drawable;

.field public s:Landroid/widget/Button;

.field public t:Ljava/lang/CharSequence;

.field public u:Landroid/os/Message;

.field public v:Landroid/graphics/drawable/Drawable;

.field public w:Landroid/widget/Button;

.field public x:Ljava/lang/CharSequence;

.field public y:Landroid/os/Message;

.field public z:Landroid/graphics/drawable/Drawable;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lb/b/k/d;Landroid/view/Window;)V
    .registers 7

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Landroidx/appcompat/app/AlertController;->n:Z

    .line 3
    iput v0, p0, Landroidx/appcompat/app/AlertController;->B:I

    const/4 v1, -0x1

    .line 4
    iput v1, p0, Landroidx/appcompat/app/AlertController;->I:I

    .line 5
    iput v0, p0, Landroidx/appcompat/app/AlertController;->Q:I

    .line 6
    new-instance v1, Landroidx/appcompat/app/AlertController$a;

    invoke-direct {v1, p0}, Landroidx/appcompat/app/AlertController$a;-><init>(Landroidx/appcompat/app/AlertController;)V

    iput-object v1, p0, Landroidx/appcompat/app/AlertController;->S:Landroid/view/View$OnClickListener;

    .line 7
    iput-object p1, p0, Landroidx/appcompat/app/AlertController;->a:Landroid/content/Context;

    .line 8
    iput-object p2, p0, Landroidx/appcompat/app/AlertController;->b:Lb/b/k/d;

    .line 9
    iput-object p3, p0, Landroidx/appcompat/app/AlertController;->c:Landroid/view/Window;

    .line 10
    new-instance p3, Landroidx/appcompat/app/AlertController$g;

    invoke-direct {p3, p2}, Landroidx/appcompat/app/AlertController$g;-><init>(Landroid/content/DialogInterface;)V

    iput-object p3, p0, Landroidx/appcompat/app/AlertController;->R:Landroid/os/Handler;

    .line 11
    sget-object p3, Lb/b/j;->AlertDialog:[I

    sget v1, Lb/b/a;->alertDialogStyle:I

    const/4 v2, 0x0

    invoke-virtual {p1, v2, p3, v1, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 12
    sget p3, Lb/b/j;->AlertDialog_android_layout:I

    invoke-virtual {p1, p3, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p3

    iput p3, p0, Landroidx/appcompat/app/AlertController;->J:I

    .line 13
    sget p3, Lb/b/j;->AlertDialog_buttonPanelSideLayout:I

    invoke-virtual {p1, p3, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p3

    iput p3, p0, Landroidx/appcompat/app/AlertController;->K:I

    .line 14
    sget p3, Lb/b/j;->AlertDialog_listLayout:I

    invoke-virtual {p1, p3, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p3

    iput p3, p0, Landroidx/appcompat/app/AlertController;->L:I

    .line 15
    sget p3, Lb/b/j;->AlertDialog_multiChoiceItemLayout:I

    invoke-virtual {p1, p3, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p3

    iput p3, p0, Landroidx/appcompat/app/AlertController;->M:I

    .line 16
    sget p3, Lb/b/j;->AlertDialog_singleChoiceItemLayout:I

    .line 17
    invoke-virtual {p1, p3, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p3

    iput p3, p0, Landroidx/appcompat/app/AlertController;->N:I

    .line 18
    sget p3, Lb/b/j;->AlertDialog_listItemLayout:I

    invoke-virtual {p1, p3, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p3

    iput p3, p0, Landroidx/appcompat/app/AlertController;->O:I

    .line 19
    sget p3, Lb/b/j;->AlertDialog_showTitle:I

    const/4 v1, 0x1

    invoke-virtual {p1, p3, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p3

    iput-boolean p3, p0, Landroidx/appcompat/app/AlertController;->P:Z

    .line 20
    sget p3, Lb/b/j;->AlertDialog_buttonIconDimen:I

    invoke-virtual {p1, p3, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p3

    iput p3, p0, Landroidx/appcompat/app/AlertController;->d:I

    .line 21
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 22
    invoke-virtual {p2, v1}, Lb/b/k/d;->b(I)Z

    return-void
.end method

.method public static a(Landroid/view/View;Landroid/view/View;Landroid/view/View;)V
    .registers 6

    const/4 v0, 0x0

    const/4 v1, 0x4

    if-eqz p1, :cond_11

    const/4 v2, -0x1

    .line 62
    invoke-virtual {p0, v2}, Landroid/view/View;->canScrollVertically(I)Z

    move-result v2

    if-eqz v2, :cond_d

    const/4 v2, 0x0

    goto :goto_e

    :cond_d
    const/4 v2, 0x4

    .line 63
    :goto_e
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    :cond_11
    if-eqz p2, :cond_1f

    const/4 p1, 0x1

    .line 64
    invoke-virtual {p0, p1}, Landroid/view/View;->canScrollVertically(I)Z

    move-result p0

    if-eqz p0, :cond_1b

    goto :goto_1c

    :cond_1b
    const/4 v0, 0x4

    .line 65
    :goto_1c
    invoke-virtual {p2, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_1f
    return-void
.end method

.method public static a(Landroid/content/Context;)Z
    .registers 4

    .line 1
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 2
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object p0

    sget v1, Lb/b/a;->alertDialogCenterButtons:I

    const/4 v2, 0x1

    invoke-virtual {p0, v1, v0, v2}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 3
    iget p0, v0, Landroid/util/TypedValue;->data:I

    if-eqz p0, :cond_14

    goto :goto_15

    :cond_14
    const/4 v2, 0x0

    :goto_15
    return v2
.end method

.method public static c(Landroid/view/View;)Z
    .registers 5

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->onCheckIsTextEditor()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_8

    return v1

    .line 2
    :cond_8
    instance-of v0, p0, Landroid/view/ViewGroup;

    const/4 v2, 0x0

    if-nez v0, :cond_e

    return v2

    .line 3
    :cond_e
    check-cast p0, Landroid/view/ViewGroup;

    .line 4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    :cond_14
    if-lez v0, :cond_23

    add-int/lit8 v0, v0, -0x1

    .line 5
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 6
    invoke-static {v3}, Landroidx/appcompat/app/AlertController;->c(Landroid/view/View;)Z

    move-result v3

    if-eqz v3, :cond_14

    return v1

    :cond_23
    return v2
.end method


# virtual methods
.method public a(I)I
    .registers 5

    .line 32
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 33
    iget-object v1, p0, Landroidx/appcompat/app/AlertController;->a:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, p1, v0, v2}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 34
    iget p1, v0, Landroid/util/TypedValue;->resourceId:I

    return p1
.end method

.method public final a(Landroid/view/View;Landroid/view/View;)Landroid/view/ViewGroup;
    .registers 5

    if-nez p1, :cond_f

    .line 37
    instance-of p1, p2, Landroid/view/ViewStub;

    if-eqz p1, :cond_c

    .line 38
    check-cast p2, Landroid/view/ViewStub;

    invoke-virtual {p2}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    move-result-object p2

    .line 39
    :cond_c
    check-cast p2, Landroid/view/ViewGroup;

    return-object p2

    :cond_f
    if-eqz p2, :cond_1e

    .line 40
    invoke-virtual {p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 41
    instance-of v1, v0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_1e

    .line 42
    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, p2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 43
    :cond_1e
    instance-of p2, p1, Landroid/view/ViewStub;

    if-eqz p2, :cond_28

    .line 44
    check-cast p1, Landroid/view/ViewStub;

    invoke-virtual {p1}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    move-result-object p1

    .line 45
    :cond_28
    check-cast p1, Landroid/view/ViewGroup;

    return-object p1
.end method

.method public a()Landroid/widget/ListView;
    .registers 2

    .line 35
    iget-object v0, p0, Landroidx/appcompat/app/AlertController;->g:Landroid/widget/ListView;

    return-object v0
.end method

.method public a(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;Landroid/os/Message;Landroid/graphics/drawable/Drawable;)V
    .registers 6

    if-nez p4, :cond_a

    if-eqz p3, :cond_a

    .line 15
    iget-object p4, p0, Landroidx/appcompat/app/AlertController;->R:Landroid/os/Handler;

    invoke-virtual {p4, p1, p3}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p4

    :cond_a
    const/4 p3, -0x3

    if-eq p1, p3, :cond_29

    const/4 p3, -0x2

    if-eq p1, p3, :cond_22

    const/4 p3, -0x1

    if-ne p1, p3, :cond_1a

    .line 16
    iput-object p2, p0, Landroidx/appcompat/app/AlertController;->p:Ljava/lang/CharSequence;

    .line 17
    iput-object p4, p0, Landroidx/appcompat/app/AlertController;->q:Landroid/os/Message;

    .line 18
    iput-object p5, p0, Landroidx/appcompat/app/AlertController;->r:Landroid/graphics/drawable/Drawable;

    goto :goto_2f

    .line 19
    :cond_1a
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Button does not exist"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 20
    :cond_22
    iput-object p2, p0, Landroidx/appcompat/app/AlertController;->t:Ljava/lang/CharSequence;

    .line 21
    iput-object p4, p0, Landroidx/appcompat/app/AlertController;->u:Landroid/os/Message;

    .line 22
    iput-object p5, p0, Landroidx/appcompat/app/AlertController;->v:Landroid/graphics/drawable/Drawable;

    goto :goto_2f

    .line 23
    :cond_29
    iput-object p2, p0, Landroidx/appcompat/app/AlertController;->x:Ljava/lang/CharSequence;

    .line 24
    iput-object p4, p0, Landroidx/appcompat/app/AlertController;->y:Landroid/os/Message;

    .line 25
    iput-object p5, p0, Landroidx/appcompat/app/AlertController;->z:Landroid/graphics/drawable/Drawable;

    :goto_2f
    return-void
.end method

.method public a(Landroid/graphics/drawable/Drawable;)V
    .registers 4

    .line 26
    iput-object p1, p0, Landroidx/appcompat/app/AlertController;->C:Landroid/graphics/drawable/Drawable;

    const/4 v0, 0x0

    .line 27
    iput v0, p0, Landroidx/appcompat/app/AlertController;->B:I

    .line 28
    iget-object v1, p0, Landroidx/appcompat/app/AlertController;->D:Landroid/widget/ImageView;

    if-eqz v1, :cond_19

    if-eqz p1, :cond_14

    .line 29
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 30
    iget-object v0, p0, Landroidx/appcompat/app/AlertController;->D:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_19

    :cond_14
    const/16 p1, 0x8

    .line 31
    invoke-virtual {v1, p1}, Landroid/widget/ImageView;->setVisibility(I)V

    :cond_19
    :goto_19
    return-void
.end method

.method public a(Landroid/view/View;)V
    .registers 2

    .line 4
    iput-object p1, p0, Landroidx/appcompat/app/AlertController;->G:Landroid/view/View;

    return-void
.end method

.method public a(Landroid/view/View;IIII)V
    .registers 6

    .line 8
    iput-object p1, p0, Landroidx/appcompat/app/AlertController;->h:Landroid/view/View;

    const/4 p1, 0x0

    .line 9
    iput p1, p0, Landroidx/appcompat/app/AlertController;->i:I

    const/4 p1, 0x1

    .line 10
    iput-boolean p1, p0, Landroidx/appcompat/app/AlertController;->n:Z

    .line 11
    iput p2, p0, Landroidx/appcompat/app/AlertController;->j:I

    .line 12
    iput p3, p0, Landroidx/appcompat/app/AlertController;->k:I

    .line 13
    iput p4, p0, Landroidx/appcompat/app/AlertController;->l:I

    .line 14
    iput p5, p0, Landroidx/appcompat/app/AlertController;->m:I

    return-void
.end method

.method public final a(Landroid/view/ViewGroup;)V
    .registers 9

    const v0, 0x1020019

    .line 66
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Landroidx/appcompat/app/AlertController;->o:Landroid/widget/Button;

    .line 67
    iget-object v1, p0, Landroidx/appcompat/app/AlertController;->S:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 68
    iget-object v0, p0, Landroidx/appcompat/app/AlertController;->p:Ljava/lang/CharSequence;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x1

    const/16 v2, 0x8

    const/4 v3, 0x0

    const/4 v4, 0x0

    if-eqz v0, :cond_28

    iget-object v0, p0, Landroidx/appcompat/app/AlertController;->r:Landroid/graphics/drawable/Drawable;

    if-nez v0, :cond_28

    .line 69
    iget-object v0, p0, Landroidx/appcompat/app/AlertController;->o:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setVisibility(I)V

    const/4 v0, 0x0

    goto :goto_45

    .line 70
    :cond_28
    iget-object v0, p0, Landroidx/appcompat/app/AlertController;->o:Landroid/widget/Button;

    iget-object v5, p0, Landroidx/appcompat/app/AlertController;->p:Ljava/lang/CharSequence;

    invoke-virtual {v0, v5}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 71
    iget-object v0, p0, Landroidx/appcompat/app/AlertController;->r:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_3f

    .line 72
    iget v5, p0, Landroidx/appcompat/app/AlertController;->d:I

    invoke-virtual {v0, v4, v4, v5, v5}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 73
    iget-object v0, p0, Landroidx/appcompat/app/AlertController;->o:Landroid/widget/Button;

    iget-object v5, p0, Landroidx/appcompat/app/AlertController;->r:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v5, v3, v3, v3}, Landroid/widget/Button;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 74
    :cond_3f
    iget-object v0, p0, Landroidx/appcompat/app/AlertController;->o:Landroid/widget/Button;

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setVisibility(I)V

    const/4 v0, 0x1

    :goto_45
    const v5, 0x102001a

    .line 75
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/Button;

    iput-object v5, p0, Landroidx/appcompat/app/AlertController;->s:Landroid/widget/Button;

    .line 76
    iget-object v6, p0, Landroidx/appcompat/app/AlertController;->S:Landroid/view/View$OnClickListener;

    invoke-virtual {v5, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 77
    iget-object v5, p0, Landroidx/appcompat/app/AlertController;->t:Ljava/lang/CharSequence;

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_67

    iget-object v5, p0, Landroidx/appcompat/app/AlertController;->v:Landroid/graphics/drawable/Drawable;

    if-nez v5, :cond_67

    .line 78
    iget-object v5, p0, Landroidx/appcompat/app/AlertController;->s:Landroid/widget/Button;

    invoke-virtual {v5, v2}, Landroid/widget/Button;->setVisibility(I)V

    goto :goto_85

    .line 79
    :cond_67
    iget-object v5, p0, Landroidx/appcompat/app/AlertController;->s:Landroid/widget/Button;

    iget-object v6, p0, Landroidx/appcompat/app/AlertController;->t:Ljava/lang/CharSequence;

    invoke-virtual {v5, v6}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 80
    iget-object v5, p0, Landroidx/appcompat/app/AlertController;->v:Landroid/graphics/drawable/Drawable;

    if-eqz v5, :cond_7e

    .line 81
    iget v6, p0, Landroidx/appcompat/app/AlertController;->d:I

    invoke-virtual {v5, v4, v4, v6, v6}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 82
    iget-object v5, p0, Landroidx/appcompat/app/AlertController;->s:Landroid/widget/Button;

    iget-object v6, p0, Landroidx/appcompat/app/AlertController;->v:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v5, v6, v3, v3, v3}, Landroid/widget/Button;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 83
    :cond_7e
    iget-object v5, p0, Landroidx/appcompat/app/AlertController;->s:Landroid/widget/Button;

    invoke-virtual {v5, v4}, Landroid/widget/Button;->setVisibility(I)V

    or-int/lit8 v0, v0, 0x2

    :goto_85
    const v5, 0x102001b

    .line 84
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/Button;

    iput-object v5, p0, Landroidx/appcompat/app/AlertController;->w:Landroid/widget/Button;

    .line 85
    iget-object v6, p0, Landroidx/appcompat/app/AlertController;->S:Landroid/view/View$OnClickListener;

    invoke-virtual {v5, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 86
    iget-object v5, p0, Landroidx/appcompat/app/AlertController;->x:Ljava/lang/CharSequence;

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_a7

    iget-object v5, p0, Landroidx/appcompat/app/AlertController;->z:Landroid/graphics/drawable/Drawable;

    if-nez v5, :cond_a7

    .line 87
    iget-object v3, p0, Landroidx/appcompat/app/AlertController;->w:Landroid/widget/Button;

    invoke-virtual {v3, v2}, Landroid/widget/Button;->setVisibility(I)V

    goto :goto_c5

    .line 88
    :cond_a7
    iget-object v5, p0, Landroidx/appcompat/app/AlertController;->w:Landroid/widget/Button;

    iget-object v6, p0, Landroidx/appcompat/app/AlertController;->x:Ljava/lang/CharSequence;

    invoke-virtual {v5, v6}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 89
    iget-object v5, p0, Landroidx/appcompat/app/AlertController;->z:Landroid/graphics/drawable/Drawable;

    if-eqz v5, :cond_be

    .line 90
    iget v6, p0, Landroidx/appcompat/app/AlertController;->d:I

    invoke-virtual {v5, v4, v4, v6, v6}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 91
    iget-object v5, p0, Landroidx/appcompat/app/AlertController;->w:Landroid/widget/Button;

    iget-object v6, p0, Landroidx/appcompat/app/AlertController;->z:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v5, v6, v3, v3, v3}, Landroid/widget/Button;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 92
    :cond_be
    iget-object v3, p0, Landroidx/appcompat/app/AlertController;->w:Landroid/widget/Button;

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setVisibility(I)V

    or-int/lit8 v0, v0, 0x4

    .line 93
    :goto_c5
    iget-object v3, p0, Landroidx/appcompat/app/AlertController;->a:Landroid/content/Context;

    invoke-static {v3}, Landroidx/appcompat/app/AlertController;->a(Landroid/content/Context;)Z

    move-result v3

    if-eqz v3, :cond_e6

    if-ne v0, v1, :cond_d5

    .line 94
    iget-object v3, p0, Landroidx/appcompat/app/AlertController;->o:Landroid/widget/Button;

    invoke-virtual {p0, v3}, Landroidx/appcompat/app/AlertController;->a(Landroid/widget/Button;)V

    goto :goto_e6

    :cond_d5
    const/4 v3, 0x2

    if-ne v0, v3, :cond_de

    .line 95
    iget-object v3, p0, Landroidx/appcompat/app/AlertController;->s:Landroid/widget/Button;

    invoke-virtual {p0, v3}, Landroidx/appcompat/app/AlertController;->a(Landroid/widget/Button;)V

    goto :goto_e6

    :cond_de
    const/4 v3, 0x4

    if-ne v0, v3, :cond_e6

    .line 96
    iget-object v3, p0, Landroidx/appcompat/app/AlertController;->w:Landroid/widget/Button;

    invoke-virtual {p0, v3}, Landroidx/appcompat/app/AlertController;->a(Landroid/widget/Button;)V

    :cond_e6
    :goto_e6
    if-eqz v0, :cond_e9

    goto :goto_ea

    :cond_e9
    const/4 v1, 0x0

    :goto_ea
    if-nez v1, :cond_ef

    .line 97
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->setVisibility(I)V

    :cond_ef
    return-void
.end method

.method public final a(Landroid/view/ViewGroup;Landroid/view/View;II)V
    .registers 9

    .line 46
    iget-object v0, p0, Landroidx/appcompat/app/AlertController;->c:Landroid/view/Window;

    sget v1, Lb/b/f;->scrollIndicatorUp:I

    invoke-virtual {v0, v1}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 47
    iget-object v1, p0, Landroidx/appcompat/app/AlertController;->c:Landroid/view/Window;

    sget v2, Lb/b/f;->scrollIndicatorDown:I

    invoke-virtual {v1, v2}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 48
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x17

    if-lt v2, v3, :cond_24

    .line 49
    invoke-static {p2, p3, p4}, Lb/h/m/y;->a(Landroid/view/View;II)V

    if-eqz v0, :cond_1e

    .line 50
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_1e
    if-eqz v1, :cond_77

    .line 51
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    goto :goto_77

    :cond_24
    const/4 p2, 0x0

    if-eqz v0, :cond_2f

    and-int/lit8 p4, p3, 0x1

    if-nez p4, :cond_2f

    .line 52
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    move-object v0, p2

    :cond_2f
    if-eqz v1, :cond_39

    and-int/lit8 p3, p3, 0x2

    if-nez p3, :cond_39

    .line 53
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    move-object v1, p2

    :cond_39
    if-nez v0, :cond_3d

    if-eqz v1, :cond_77

    .line 54
    :cond_3d
    iget-object p2, p0, Landroidx/appcompat/app/AlertController;->f:Ljava/lang/CharSequence;

    if-eqz p2, :cond_56

    .line 55
    iget-object p1, p0, Landroidx/appcompat/app/AlertController;->A:Landroidx/core/widget/NestedScrollView;

    new-instance p2, Landroidx/appcompat/app/AlertController$b;

    invoke-direct {p2, p0, v0, v1}, Landroidx/appcompat/app/AlertController$b;-><init>(Landroidx/appcompat/app/AlertController;Landroid/view/View;Landroid/view/View;)V

    invoke-virtual {p1, p2}, Landroidx/core/widget/NestedScrollView;->setOnScrollChangeListener(Landroidx/core/widget/NestedScrollView$b;)V

    .line 56
    iget-object p1, p0, Landroidx/appcompat/app/AlertController;->A:Landroidx/core/widget/NestedScrollView;

    new-instance p2, Landroidx/appcompat/app/AlertController$c;

    invoke-direct {p2, p0, v0, v1}, Landroidx/appcompat/app/AlertController$c;-><init>(Landroidx/appcompat/app/AlertController;Landroid/view/View;Landroid/view/View;)V

    invoke-virtual {p1, p2}, Landroid/widget/FrameLayout;->post(Ljava/lang/Runnable;)Z

    goto :goto_77

    .line 57
    :cond_56
    iget-object p2, p0, Landroidx/appcompat/app/AlertController;->g:Landroid/widget/ListView;

    if-eqz p2, :cond_6d

    .line 58
    new-instance p1, Landroidx/appcompat/app/AlertController$d;

    invoke-direct {p1, p0, v0, v1}, Landroidx/appcompat/app/AlertController$d;-><init>(Landroidx/appcompat/app/AlertController;Landroid/view/View;Landroid/view/View;)V

    invoke-virtual {p2, p1}, Landroid/widget/ListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 59
    iget-object p1, p0, Landroidx/appcompat/app/AlertController;->g:Landroid/widget/ListView;

    new-instance p2, Landroidx/appcompat/app/AlertController$e;

    invoke-direct {p2, p0, v0, v1}, Landroidx/appcompat/app/AlertController$e;-><init>(Landroidx/appcompat/app/AlertController;Landroid/view/View;Landroid/view/View;)V

    invoke-virtual {p1, p2}, Landroid/widget/ListView;->post(Ljava/lang/Runnable;)Z

    goto :goto_77

    :cond_6d
    if-eqz v0, :cond_72

    .line 60
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_72
    if-eqz v1, :cond_77

    .line 61
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_77
    :goto_77
    return-void
.end method

.method public final a(Landroid/widget/Button;)V
    .registers 4

    .line 98
    invoke-virtual {p1}, Landroid/widget/Button;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, 0x1

    .line 99
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    const/high16 v1, 0x3f000000    # 0.5f

    .line 100
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 101
    invoke-virtual {p1, v0}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method public a(Ljava/lang/CharSequence;)V
    .registers 3

    .line 5
    iput-object p1, p0, Landroidx/appcompat/app/AlertController;->f:Ljava/lang/CharSequence;

    .line 6
    iget-object v0, p0, Landroidx/appcompat/app/AlertController;->F:Landroid/widget/TextView;

    if-eqz v0, :cond_9

    .line 7
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_9
    return-void
.end method

.method public a(ILandroid/view/KeyEvent;)Z
    .registers 3

    .line 36
    iget-object p1, p0, Landroidx/appcompat/app/AlertController;->A:Landroidx/core/widget/NestedScrollView;

    if-eqz p1, :cond_c

    invoke-virtual {p1, p2}, Landroidx/core/widget/NestedScrollView;->a(Landroid/view/KeyEvent;)Z

    move-result p1

    if-eqz p1, :cond_c

    const/4 p1, 0x1

    goto :goto_d

    :cond_c
    const/4 p1, 0x0

    :goto_d
    return p1
.end method

.method public b()V
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/app/AlertController;->c()I

    move-result v0

    .line 2
    iget-object v1, p0, Landroidx/appcompat/app/AlertController;->b:Lb/b/k/d;

    invoke-virtual {v1, v0}, Lb/b/k/d;->setContentView(I)V

    .line 3
    invoke-virtual {p0}, Landroidx/appcompat/app/AlertController;->d()V

    return-void
.end method

.method public b(I)V
    .registers 3

    const/4 v0, 0x0

    .line 10
    iput-object v0, p0, Landroidx/appcompat/app/AlertController;->C:Landroid/graphics/drawable/Drawable;

    .line 11
    iput p1, p0, Landroidx/appcompat/app/AlertController;->B:I

    .line 12
    iget-object v0, p0, Landroidx/appcompat/app/AlertController;->D:Landroid/widget/ImageView;

    if-eqz v0, :cond_1c

    if-eqz p1, :cond_17

    const/4 p1, 0x0

    .line 13
    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 14
    iget-object p1, p0, Landroidx/appcompat/app/AlertController;->D:Landroid/widget/ImageView;

    iget v0, p0, Landroidx/appcompat/app/AlertController;->B:I

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_1c

    :cond_17
    const/16 p1, 0x8

    .line 15
    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setVisibility(I)V

    :cond_1c
    :goto_1c
    return-void
.end method

.method public b(Landroid/view/View;)V
    .registers 2

    .line 7
    iput-object p1, p0, Landroidx/appcompat/app/AlertController;->h:Landroid/view/View;

    const/4 p1, 0x0

    .line 8
    iput p1, p0, Landroidx/appcompat/app/AlertController;->i:I

    .line 9
    iput-boolean p1, p0, Landroidx/appcompat/app/AlertController;->n:Z

    return-void
.end method

.method public final b(Landroid/view/ViewGroup;)V
    .registers 6

    .line 17
    iget-object v0, p0, Landroidx/appcompat/app/AlertController;->c:Landroid/view/Window;

    sget v1, Lb/b/f;->scrollView:I

    invoke-virtual {v0, v1}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/core/widget/NestedScrollView;

    iput-object v0, p0, Landroidx/appcompat/app/AlertController;->A:Landroidx/core/widget/NestedScrollView;

    const/4 v1, 0x0

    .line 18
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setFocusable(Z)V

    .line 19
    iget-object v0, p0, Landroidx/appcompat/app/AlertController;->A:Landroidx/core/widget/NestedScrollView;

    invoke-virtual {v0, v1}, Landroidx/core/widget/NestedScrollView;->setNestedScrollingEnabled(Z)V

    const v0, 0x102000b

    .line 20
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Landroidx/appcompat/app/AlertController;->F:Landroid/widget/TextView;

    if-nez v0, :cond_23

    return-void

    .line 21
    :cond_23
    iget-object v1, p0, Landroidx/appcompat/app/AlertController;->f:Ljava/lang/CharSequence;

    if-eqz v1, :cond_2b

    .line 22
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_5b

    :cond_2b
    const/16 v1, 0x8

    .line 23
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 24
    iget-object v0, p0, Landroidx/appcompat/app/AlertController;->A:Landroidx/core/widget/NestedScrollView;

    iget-object v2, p0, Landroidx/appcompat/app/AlertController;->F:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 25
    iget-object v0, p0, Landroidx/appcompat/app/AlertController;->g:Landroid/widget/ListView;

    if-eqz v0, :cond_58

    .line 26
    iget-object p1, p0, Landroidx/appcompat/app/AlertController;->A:Landroidx/core/widget/NestedScrollView;

    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup;

    .line 27
    iget-object v0, p0, Landroidx/appcompat/app/AlertController;->A:Landroidx/core/widget/NestedScrollView;

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v0

    .line 28
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->removeViewAt(I)V

    .line 29
    iget-object v1, p0, Landroidx/appcompat/app/AlertController;->g:Landroid/widget/ListView;

    new-instance v2, Landroid/view/ViewGroup$LayoutParams;

    const/4 v3, -0x1

    invoke-direct {v2, v3, v3}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v1, v0, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    goto :goto_5b

    .line 30
    :cond_58
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    :goto_5b
    return-void
.end method

.method public b(Ljava/lang/CharSequence;)V
    .registers 3

    .line 4
    iput-object p1, p0, Landroidx/appcompat/app/AlertController;->e:Ljava/lang/CharSequence;

    .line 5
    iget-object v0, p0, Landroidx/appcompat/app/AlertController;->E:Landroid/widget/TextView;

    if-eqz v0, :cond_9

    .line 6
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_9
    return-void
.end method

.method public b(ILandroid/view/KeyEvent;)Z
    .registers 3

    .line 16
    iget-object p1, p0, Landroidx/appcompat/app/AlertController;->A:Landroidx/core/widget/NestedScrollView;

    if-eqz p1, :cond_c

    invoke-virtual {p1, p2}, Landroidx/core/widget/NestedScrollView;->a(Landroid/view/KeyEvent;)Z

    move-result p1

    if-eqz p1, :cond_c

    const/4 p1, 0x1

    goto :goto_d

    :cond_c
    const/4 p1, 0x0

    :goto_d
    return p1
.end method

.method public final c()I
    .registers 4

    .line 7
    iget v0, p0, Landroidx/appcompat/app/AlertController;->K:I

    if-nez v0, :cond_7

    .line 8
    iget v0, p0, Landroidx/appcompat/app/AlertController;->J:I

    return v0

    .line 9
    :cond_7
    iget v1, p0, Landroidx/appcompat/app/AlertController;->Q:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_d

    return v0

    .line 10
    :cond_d
    iget v0, p0, Landroidx/appcompat/app/AlertController;->J:I

    return v0
.end method

.method public c(I)V
    .registers 3

    const/4 v0, 0x0

    .line 11
    iput-object v0, p0, Landroidx/appcompat/app/AlertController;->h:Landroid/view/View;

    .line 12
    iput p1, p0, Landroidx/appcompat/app/AlertController;->i:I

    const/4 p1, 0x0

    .line 13
    iput-boolean p1, p0, Landroidx/appcompat/app/AlertController;->n:Z

    return-void
.end method

.method public final c(Landroid/view/ViewGroup;)V
    .registers 7

    .line 14
    iget-object v0, p0, Landroidx/appcompat/app/AlertController;->h:Landroid/view/View;

    const/4 v1, 0x0

    if-eqz v0, :cond_6

    goto :goto_18

    .line 15
    :cond_6
    iget v0, p0, Landroidx/appcompat/app/AlertController;->i:I

    if-eqz v0, :cond_17

    .line 16
    iget-object v0, p0, Landroidx/appcompat/app/AlertController;->a:Landroid/content/Context;

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .line 17
    iget v2, p0, Landroidx/appcompat/app/AlertController;->i:I

    invoke-virtual {v0, v2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    goto :goto_18

    :cond_17
    const/4 v0, 0x0

    :goto_18
    if-eqz v0, :cond_1b

    const/4 v1, 0x1

    :cond_1b
    if-eqz v1, :cond_23

    .line 18
    invoke-static {v0}, Landroidx/appcompat/app/AlertController;->c(Landroid/view/View;)Z

    move-result v2

    if-nez v2, :cond_2a

    .line 19
    :cond_23
    iget-object v2, p0, Landroidx/appcompat/app/AlertController;->c:Landroid/view/Window;

    const/high16 v3, 0x20000

    invoke-virtual {v2, v3, v3}, Landroid/view/Window;->setFlags(II)V

    :cond_2a
    if-eqz v1, :cond_5c

    .line 20
    iget-object v1, p0, Landroidx/appcompat/app/AlertController;->c:Landroid/view/Window;

    sget v2, Lb/b/f;->custom:I

    invoke-virtual {v1, v2}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/FrameLayout;

    .line 21
    new-instance v2, Landroid/view/ViewGroup$LayoutParams;

    const/4 v3, -0x1

    invoke-direct {v2, v3, v3}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v0, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 22
    iget-boolean v0, p0, Landroidx/appcompat/app/AlertController;->n:Z

    if-eqz v0, :cond_4e

    .line 23
    iget v0, p0, Landroidx/appcompat/app/AlertController;->j:I

    iget v2, p0, Landroidx/appcompat/app/AlertController;->k:I

    iget v3, p0, Landroidx/appcompat/app/AlertController;->l:I

    iget v4, p0, Landroidx/appcompat/app/AlertController;->m:I

    invoke-virtual {v1, v0, v2, v3, v4}, Landroid/widget/FrameLayout;->setPadding(IIII)V

    .line 24
    :cond_4e
    iget-object v0, p0, Landroidx/appcompat/app/AlertController;->g:Landroid/widget/ListView;

    if-eqz v0, :cond_61

    .line 25
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;

    const/4 v0, 0x0

    iput v0, p1, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    goto :goto_61

    :cond_5c
    const/16 v0, 0x8

    .line 26
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setVisibility(I)V

    :cond_61
    :goto_61
    return-void
.end method

.method public final d()V
    .registers 10

    .line 1
    iget-object v0, p0, Landroidx/appcompat/app/AlertController;->c:Landroid/view/Window;

    sget v1, Lb/b/f;->parentPanel:I

    invoke-virtual {v0, v1}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 2
    sget v1, Lb/b/f;->topPanel:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 3
    sget v2, Lb/b/f;->contentPanel:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    .line 4
    sget v3, Lb/b/f;->buttonPanel:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .line 5
    sget v4, Lb/b/f;->customPanel:I

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 6
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AlertController;->c(Landroid/view/ViewGroup;)V

    .line 7
    sget v4, Lb/b/f;->topPanel:I

    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v4

    .line 8
    sget v5, Lb/b/f;->contentPanel:I

    invoke-virtual {v0, v5}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v5

    .line 9
    sget v6, Lb/b/f;->buttonPanel:I

    invoke-virtual {v0, v6}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v6

    .line 10
    invoke-virtual {p0, v4, v1}, Landroidx/appcompat/app/AlertController;->a(Landroid/view/View;Landroid/view/View;)Landroid/view/ViewGroup;

    move-result-object v1

    .line 11
    invoke-virtual {p0, v5, v2}, Landroidx/appcompat/app/AlertController;->a(Landroid/view/View;Landroid/view/View;)Landroid/view/ViewGroup;

    move-result-object v2

    .line 12
    invoke-virtual {p0, v6, v3}, Landroidx/appcompat/app/AlertController;->a(Landroid/view/View;Landroid/view/View;)Landroid/view/ViewGroup;

    move-result-object v3

    .line 13
    invoke-virtual {p0, v2}, Landroidx/appcompat/app/AlertController;->b(Landroid/view/ViewGroup;)V

    .line 14
    invoke-virtual {p0, v3}, Landroidx/appcompat/app/AlertController;->a(Landroid/view/ViewGroup;)V

    .line 15
    invoke-virtual {p0, v1}, Landroidx/appcompat/app/AlertController;->d(Landroid/view/ViewGroup;)V

    const/16 v4, 0x8

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-eqz v0, :cond_5a

    .line 16
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v0

    if-eq v0, v4, :cond_5a

    const/4 v0, 0x1

    goto :goto_5b

    :cond_5a
    const/4 v0, 0x0

    :goto_5b
    if-eqz v1, :cond_65

    .line 17
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v7

    if-eq v7, v4, :cond_65

    const/4 v7, 0x1

    goto :goto_66

    :cond_65
    const/4 v7, 0x0

    :goto_66
    if-eqz v3, :cond_70

    .line 18
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v3

    if-eq v3, v4, :cond_70

    const/4 v3, 0x1

    goto :goto_71

    :cond_70
    const/4 v3, 0x0

    :goto_71
    if-nez v3, :cond_80

    if-eqz v2, :cond_80

    .line 19
    sget v4, Lb/b/f;->textSpacerNoButtons:I

    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v4

    if-eqz v4, :cond_80

    .line 20
    invoke-virtual {v4, v6}, Landroid/view/View;->setVisibility(I)V

    :cond_80
    if-eqz v7, :cond_9e

    .line 21
    iget-object v4, p0, Landroidx/appcompat/app/AlertController;->A:Landroidx/core/widget/NestedScrollView;

    if-eqz v4, :cond_89

    .line 22
    invoke-virtual {v4, v5}, Landroid/widget/FrameLayout;->setClipToPadding(Z)V

    :cond_89
    const/4 v4, 0x0

    .line 23
    iget-object v8, p0, Landroidx/appcompat/app/AlertController;->f:Ljava/lang/CharSequence;

    if-nez v8, :cond_92

    iget-object v8, p0, Landroidx/appcompat/app/AlertController;->g:Landroid/widget/ListView;

    if-eqz v8, :cond_98

    .line 24
    :cond_92
    sget v4, Lb/b/f;->titleDividerNoCustom:I

    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v4

    :cond_98
    if-eqz v4, :cond_ab

    .line 25
    invoke-virtual {v4, v6}, Landroid/view/View;->setVisibility(I)V

    goto :goto_ab

    :cond_9e
    if-eqz v2, :cond_ab

    .line 26
    sget v1, Lb/b/f;->textSpacerNoTitle:I

    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_ab

    .line 27
    invoke-virtual {v1, v6}, Landroid/view/View;->setVisibility(I)V

    .line 28
    :cond_ab
    :goto_ab
    iget-object v1, p0, Landroidx/appcompat/app/AlertController;->g:Landroid/widget/ListView;

    instance-of v4, v1, Landroidx/appcompat/app/AlertController$RecycleListView;

    if-eqz v4, :cond_b6

    .line 29
    check-cast v1, Landroidx/appcompat/app/AlertController$RecycleListView;

    invoke-virtual {v1, v7, v3}, Landroidx/appcompat/app/AlertController$RecycleListView;->a(ZZ)V

    :cond_b6
    if-nez v0, :cond_ca

    .line 30
    iget-object v0, p0, Landroidx/appcompat/app/AlertController;->g:Landroid/widget/ListView;

    if-eqz v0, :cond_bd

    goto :goto_bf

    :cond_bd
    iget-object v0, p0, Landroidx/appcompat/app/AlertController;->A:Landroidx/core/widget/NestedScrollView;

    :goto_bf
    if-eqz v0, :cond_ca

    if-eqz v3, :cond_c4

    const/4 v6, 0x2

    :cond_c4
    or-int v1, v7, v6

    const/4 v3, 0x3

    .line 31
    invoke-virtual {p0, v2, v0, v1, v3}, Landroidx/appcompat/app/AlertController;->a(Landroid/view/ViewGroup;Landroid/view/View;II)V

    .line 32
    :cond_ca
    iget-object v0, p0, Landroidx/appcompat/app/AlertController;->g:Landroid/widget/ListView;

    if-eqz v0, :cond_e0

    .line 33
    iget-object v1, p0, Landroidx/appcompat/app/AlertController;->H:Landroid/widget/ListAdapter;

    if-eqz v1, :cond_e0

    .line 34
    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 35
    iget v1, p0, Landroidx/appcompat/app/AlertController;->I:I

    const/4 v2, -0x1

    if-le v1, v2, :cond_e0

    .line 36
    invoke-virtual {v0, v1, v5}, Landroid/widget/ListView;->setItemChecked(IZ)V

    .line 37
    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setSelection(I)V

    :cond_e0
    return-void
.end method

.method public final d(Landroid/view/ViewGroup;)V
    .registers 7

    .line 38
    iget-object v0, p0, Landroidx/appcompat/app/AlertController;->G:Landroid/view/View;

    const/16 v1, 0x8

    if-eqz v0, :cond_20

    .line 39
    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    const/4 v2, -0x1

    const/4 v3, -0x2

    invoke-direct {v0, v2, v3}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 40
    iget-object v2, p0, Landroidx/appcompat/app/AlertController;->G:Landroid/view/View;

    const/4 v3, 0x0

    invoke-virtual {p1, v2, v3, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 41
    iget-object p1, p0, Landroidx/appcompat/app/AlertController;->c:Landroid/view/Window;

    sget v0, Lb/b/f;->title_template:I

    invoke-virtual {p1, v0}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    move-result-object p1

    .line 42
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_96

    .line 43
    :cond_20
    iget-object v0, p0, Landroidx/appcompat/app/AlertController;->c:Landroid/view/Window;

    const v2, 0x1020006

    invoke-virtual {v0, v2}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Landroidx/appcompat/app/AlertController;->D:Landroid/widget/ImageView;

    .line 44
    iget-object v0, p0, Landroidx/appcompat/app/AlertController;->e:Ljava/lang/CharSequence;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_83

    .line 45
    iget-boolean v0, p0, Landroidx/appcompat/app/AlertController;->P:Z

    if-eqz v0, :cond_83

    .line 46
    iget-object p1, p0, Landroidx/appcompat/app/AlertController;->c:Landroid/view/Window;

    sget v0, Lb/b/f;->alertTitle:I

    invoke-virtual {p1, v0}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Landroidx/appcompat/app/AlertController;->E:Landroid/widget/TextView;

    .line 47
    iget-object v0, p0, Landroidx/appcompat/app/AlertController;->e:Ljava/lang/CharSequence;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 48
    iget p1, p0, Landroidx/appcompat/app/AlertController;->B:I

    if-eqz p1, :cond_56

    .line 49
    iget-object v0, p0, Landroidx/appcompat/app/AlertController;->D:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_96

    .line 50
    :cond_56
    iget-object p1, p0, Landroidx/appcompat/app/AlertController;->C:Landroid/graphics/drawable/Drawable;

    if-eqz p1, :cond_60

    .line 51
    iget-object v0, p0, Landroidx/appcompat/app/AlertController;->D:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_96

    .line 52
    :cond_60
    iget-object p1, p0, Landroidx/appcompat/app/AlertController;->E:Landroid/widget/TextView;

    iget-object v0, p0, Landroidx/appcompat/app/AlertController;->D:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getPaddingLeft()I

    move-result v0

    iget-object v2, p0, Landroidx/appcompat/app/AlertController;->D:Landroid/widget/ImageView;

    .line 53
    invoke-virtual {v2}, Landroid/widget/ImageView;->getPaddingTop()I

    move-result v2

    iget-object v3, p0, Landroidx/appcompat/app/AlertController;->D:Landroid/widget/ImageView;

    .line 54
    invoke-virtual {v3}, Landroid/widget/ImageView;->getPaddingRight()I

    move-result v3

    iget-object v4, p0, Landroidx/appcompat/app/AlertController;->D:Landroid/widget/ImageView;

    .line 55
    invoke-virtual {v4}, Landroid/widget/ImageView;->getPaddingBottom()I

    move-result v4

    .line 56
    invoke-virtual {p1, v0, v2, v3, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 57
    iget-object p1, p0, Landroidx/appcompat/app/AlertController;->D:Landroid/widget/ImageView;

    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_96

    .line 58
    :cond_83
    iget-object v0, p0, Landroidx/appcompat/app/AlertController;->c:Landroid/view/Window;

    sget v2, Lb/b/f;->title_template:I

    invoke-virtual {v0, v2}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 59
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 60
    iget-object v0, p0, Landroidx/appcompat/app/AlertController;->D:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 61
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    :goto_96
    return-void
.end method
