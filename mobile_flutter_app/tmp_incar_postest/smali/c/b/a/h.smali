.class public final Lc/b/a/h;
.super Ljava/lang/Object;
.source "ImmersionBar.java"

# interfaces
.implements Lc/b/a/i;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x13
.end annotation


# instance fields
.field public A:Z

.field public B:Z

.field public C:I

.field public D:I

.field public E:I

.field public F:I

.field public h:Landroid/app/Activity;

.field public i:Landroidx/fragment/app/Fragment;

.field public j:Landroid/app/Fragment;

.field public k:Landroid/app/Dialog;

.field public l:Landroid/view/Window;

.field public m:Landroid/view/ViewGroup;

.field public n:Landroid/view/ViewGroup;

.field public o:Lc/b/a/h;

.field public p:Z

.field public q:Z

.field public r:Z

.field public s:Lc/b/a/c;

.field public t:Lc/b/a/a;

.field public u:I

.field public v:I

.field public w:I

.field public x:Lc/b/a/g;

.field public y:I

.field public z:Z


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .registers 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lc/b/a/h;->p:Z

    .line 3
    iput-boolean v0, p0, Lc/b/a/h;->q:Z

    .line 4
    iput-boolean v0, p0, Lc/b/a/h;->r:Z

    .line 5
    iput v0, p0, Lc/b/a/h;->u:I

    .line 6
    iput v0, p0, Lc/b/a/h;->v:I

    .line 7
    iput v0, p0, Lc/b/a/h;->w:I

    const/4 v1, 0x0

    .line 8
    iput-object v1, p0, Lc/b/a/h;->x:Lc/b/a/g;

    .line 9
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 10
    iput v0, p0, Lc/b/a/h;->y:I

    .line 11
    iput-boolean v0, p0, Lc/b/a/h;->z:Z

    .line 12
    iput-boolean v0, p0, Lc/b/a/h;->A:Z

    .line 13
    iput-boolean v0, p0, Lc/b/a/h;->B:Z

    .line 14
    iput v0, p0, Lc/b/a/h;->C:I

    iput v0, p0, Lc/b/a/h;->D:I

    iput v0, p0, Lc/b/a/h;->E:I

    iput v0, p0, Lc/b/a/h;->F:I

    .line 15
    iput-object p1, p0, Lc/b/a/h;->h:Landroid/app/Activity;

    .line 16
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p0, p1}, Lc/b/a/h;->a(Landroid/view/Window;)V

    return-void
.end method

.method public constructor <init>(Landroid/app/DialogFragment;)V
    .registers 4

    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 77
    iput-boolean v0, p0, Lc/b/a/h;->p:Z

    .line 78
    iput-boolean v0, p0, Lc/b/a/h;->q:Z

    .line 79
    iput-boolean v0, p0, Lc/b/a/h;->r:Z

    .line 80
    iput v0, p0, Lc/b/a/h;->u:I

    .line 81
    iput v0, p0, Lc/b/a/h;->v:I

    .line 82
    iput v0, p0, Lc/b/a/h;->w:I

    const/4 v1, 0x0

    .line 83
    iput-object v1, p0, Lc/b/a/h;->x:Lc/b/a/g;

    .line 84
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 85
    iput v0, p0, Lc/b/a/h;->y:I

    .line 86
    iput-boolean v0, p0, Lc/b/a/h;->z:Z

    .line 87
    iput-boolean v0, p0, Lc/b/a/h;->A:Z

    .line 88
    iput-boolean v0, p0, Lc/b/a/h;->B:Z

    .line 89
    iput v0, p0, Lc/b/a/h;->C:I

    iput v0, p0, Lc/b/a/h;->D:I

    iput v0, p0, Lc/b/a/h;->E:I

    iput v0, p0, Lc/b/a/h;->F:I

    const/4 v0, 0x1

    .line 90
    iput-boolean v0, p0, Lc/b/a/h;->r:Z

    .line 91
    iput-boolean v0, p0, Lc/b/a/h;->q:Z

    .line 92
    invoke-virtual {p1}, Landroid/app/DialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iput-object v0, p0, Lc/b/a/h;->h:Landroid/app/Activity;

    .line 93
    iput-object p1, p0, Lc/b/a/h;->j:Landroid/app/Fragment;

    .line 94
    invoke-virtual {p1}, Landroid/app/DialogFragment;->getDialog()Landroid/app/Dialog;

    move-result-object p1

    iput-object p1, p0, Lc/b/a/h;->k:Landroid/app/Dialog;

    .line 95
    invoke-virtual {p0}, Lc/b/a/h;->c()V

    .line 96
    iget-object p1, p0, Lc/b/a/h;->k:Landroid/app/Dialog;

    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p0, p1}, Lc/b/a/h;->a(Landroid/view/Window;)V

    return-void
.end method

.method public constructor <init>(Landroid/app/Fragment;)V
    .registers 4

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 37
    iput-boolean v0, p0, Lc/b/a/h;->p:Z

    .line 38
    iput-boolean v0, p0, Lc/b/a/h;->q:Z

    .line 39
    iput-boolean v0, p0, Lc/b/a/h;->r:Z

    .line 40
    iput v0, p0, Lc/b/a/h;->u:I

    .line 41
    iput v0, p0, Lc/b/a/h;->v:I

    .line 42
    iput v0, p0, Lc/b/a/h;->w:I

    const/4 v1, 0x0

    .line 43
    iput-object v1, p0, Lc/b/a/h;->x:Lc/b/a/g;

    .line 44
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 45
    iput v0, p0, Lc/b/a/h;->y:I

    .line 46
    iput-boolean v0, p0, Lc/b/a/h;->z:Z

    .line 47
    iput-boolean v0, p0, Lc/b/a/h;->A:Z

    .line 48
    iput-boolean v0, p0, Lc/b/a/h;->B:Z

    .line 49
    iput v0, p0, Lc/b/a/h;->C:I

    iput v0, p0, Lc/b/a/h;->D:I

    iput v0, p0, Lc/b/a/h;->E:I

    iput v0, p0, Lc/b/a/h;->F:I

    const/4 v0, 0x1

    .line 50
    iput-boolean v0, p0, Lc/b/a/h;->p:Z

    .line 51
    invoke-virtual {p1}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iput-object v0, p0, Lc/b/a/h;->h:Landroid/app/Activity;

    .line 52
    iput-object p1, p0, Lc/b/a/h;->j:Landroid/app/Fragment;

    .line 53
    invoke-virtual {p0}, Lc/b/a/h;->c()V

    .line 54
    iget-object p1, p0, Lc/b/a/h;->h:Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p0, p1}, Lc/b/a/h;->a(Landroid/view/Window;)V

    return-void
.end method

.method public constructor <init>(Landroidx/fragment/app/Fragment;)V
    .registers 4

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 18
    iput-boolean v0, p0, Lc/b/a/h;->p:Z

    .line 19
    iput-boolean v0, p0, Lc/b/a/h;->q:Z

    .line 20
    iput-boolean v0, p0, Lc/b/a/h;->r:Z

    .line 21
    iput v0, p0, Lc/b/a/h;->u:I

    .line 22
    iput v0, p0, Lc/b/a/h;->v:I

    .line 23
    iput v0, p0, Lc/b/a/h;->w:I

    const/4 v1, 0x0

    .line 24
    iput-object v1, p0, Lc/b/a/h;->x:Lc/b/a/g;

    .line 25
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 26
    iput v0, p0, Lc/b/a/h;->y:I

    .line 27
    iput-boolean v0, p0, Lc/b/a/h;->z:Z

    .line 28
    iput-boolean v0, p0, Lc/b/a/h;->A:Z

    .line 29
    iput-boolean v0, p0, Lc/b/a/h;->B:Z

    .line 30
    iput v0, p0, Lc/b/a/h;->C:I

    iput v0, p0, Lc/b/a/h;->D:I

    iput v0, p0, Lc/b/a/h;->E:I

    iput v0, p0, Lc/b/a/h;->F:I

    const/4 v0, 0x1

    .line 31
    iput-boolean v0, p0, Lc/b/a/h;->p:Z

    .line 32
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->f()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    iput-object v0, p0, Lc/b/a/h;->h:Landroid/app/Activity;

    .line 33
    iput-object p1, p0, Lc/b/a/h;->i:Landroidx/fragment/app/Fragment;

    .line 34
    invoke-virtual {p0}, Lc/b/a/h;->c()V

    .line 35
    iget-object p1, p0, Lc/b/a/h;->h:Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p0, p1}, Lc/b/a/h;->a(Landroid/view/Window;)V

    return-void
.end method

.method public constructor <init>(Lb/l/d/c;)V
    .registers 4

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 56
    iput-boolean v0, p0, Lc/b/a/h;->p:Z

    .line 57
    iput-boolean v0, p0, Lc/b/a/h;->q:Z

    .line 58
    iput-boolean v0, p0, Lc/b/a/h;->r:Z

    .line 59
    iput v0, p0, Lc/b/a/h;->u:I

    .line 60
    iput v0, p0, Lc/b/a/h;->v:I

    .line 61
    iput v0, p0, Lc/b/a/h;->w:I

    const/4 v1, 0x0

    .line 62
    iput-object v1, p0, Lc/b/a/h;->x:Lc/b/a/g;

    .line 63
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 64
    iput v0, p0, Lc/b/a/h;->y:I

    .line 65
    iput-boolean v0, p0, Lc/b/a/h;->z:Z

    .line 66
    iput-boolean v0, p0, Lc/b/a/h;->A:Z

    .line 67
    iput-boolean v0, p0, Lc/b/a/h;->B:Z

    .line 68
    iput v0, p0, Lc/b/a/h;->C:I

    iput v0, p0, Lc/b/a/h;->D:I

    iput v0, p0, Lc/b/a/h;->E:I

    iput v0, p0, Lc/b/a/h;->F:I

    const/4 v0, 0x1

    .line 69
    iput-boolean v0, p0, Lc/b/a/h;->r:Z

    .line 70
    iput-boolean v0, p0, Lc/b/a/h;->q:Z

    .line 71
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->f()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    iput-object v0, p0, Lc/b/a/h;->h:Landroid/app/Activity;

    .line 72
    iput-object p1, p0, Lc/b/a/h;->i:Landroidx/fragment/app/Fragment;

    .line 73
    invoke-virtual {p1}, Lb/l/d/c;->y0()Landroid/app/Dialog;

    move-result-object p1

    iput-object p1, p0, Lc/b/a/h;->k:Landroid/app/Dialog;

    .line 74
    invoke-virtual {p0}, Lc/b/a/h;->c()V

    .line 75
    iget-object p1, p0, Lc/b/a/h;->k:Landroid/app/Dialog;

    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p0, p1}, Lc/b/a/h;->a(Landroid/view/Window;)V

    return-void
.end method

.method public static K()Lc/b/a/r;
    .registers 1

    .line 1
    invoke-static {}, Lc/b/a/r;->a()Lc/b/a/r;

    move-result-object v0

    return-object v0
.end method

.method public static L()Z
    .registers 2

    .line 1
    invoke-static {}, Lc/b/a/m;->l()Z

    move-result v0

    if-nez v0, :cond_f

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_d

    goto :goto_f

    :cond_d
    const/4 v0, 0x0

    goto :goto_10

    :cond_f
    :goto_f
    const/4 v0, 0x1

    :goto_10
    return v0
.end method

.method public static M()Z
    .registers 2

    .line 1
    invoke-static {}, Lc/b/a/m;->l()Z

    move-result v0

    if-nez v0, :cond_15

    invoke-static {}, Lc/b/a/m;->j()Z

    move-result v0

    if-nez v0, :cond_15

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_13

    goto :goto_15

    :cond_13
    const/4 v0, 0x0

    goto :goto_16

    :cond_15
    :goto_15
    const/4 v0, 0x1

    :goto_16
    return v0
.end method

.method public static a(Landroid/app/Activity;)I
    .registers 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0xe
    .end annotation

    .line 58
    new-instance v0, Lc/b/a/a;

    invoke-direct {v0, p0}, Lc/b/a/a;-><init>(Landroid/app/Activity;)V

    .line 59
    invoke-virtual {v0}, Lc/b/a/a;->d()I

    move-result p0

    return p0
.end method

.method public static varargs a(Landroid/app/Activity;I[Landroid/view/View;)V
    .registers 8

    .line 40
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_47

    if-nez p0, :cond_9

    return-void

    :cond_9
    const/4 p0, 0x0

    if-gez p1, :cond_d

    const/4 p1, 0x0

    .line 41
    :cond_d
    array-length v0, p2

    const/4 v1, 0x0

    :goto_f
    if-ge v1, v0, :cond_47

    aget-object v2, p2, v1

    if-nez v2, :cond_16

    goto :goto_44

    .line 42
    :cond_16
    sget v3, Lc/b/a/q;->immersion_fits_layout_overlap:I

    invoke-virtual {v2, v3}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    if-nez v3, :cond_24

    .line 43
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 44
    :cond_24
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-eq v3, p1, :cond_44

    .line 45
    sget v3, Lc/b/a/q;->immersion_fits_layout_overlap:I

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 46
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    if-nez v3, :cond_3f

    .line 47
    new-instance v3, Landroid/view/ViewGroup$LayoutParams;

    const/4 v4, -0x1

    invoke-direct {v3, v4, p0}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 48
    :cond_3f
    iput p1, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 49
    invoke-virtual {v2, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_44
    :goto_44
    add-int/lit8 v1, v1, 0x1

    goto :goto_f

    :cond_47
    return-void
.end method

.method public static varargs a(Landroid/app/Activity;[Landroid/view/View;)V
    .registers 3

    .line 39
    invoke-static {p0}, Lc/b/a/h;->a(Landroid/app/Activity;)I

    move-result v0

    invoke-static {p0, v0, p1}, Lc/b/a/h;->b(Landroid/app/Activity;I[Landroid/view/View;)V

    return-void
.end method

.method public static a(Landroid/view/View;)Z
    .registers 7

    const/4 v0, 0x0

    if-nez p0, :cond_4

    return v0

    .line 50
    :cond_4
    invoke-virtual {p0}, Landroid/view/View;->getFitsSystemWindows()Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_c

    return v2

    .line 51
    :cond_c
    instance-of v1, p0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_32

    .line 52
    check-cast p0, Landroid/view/ViewGroup;

    .line 53
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    const/4 v3, 0x0

    :goto_17
    if-ge v3, v1, :cond_32

    .line 54
    invoke-virtual {p0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 55
    instance-of v5, v4, Landroidx/drawerlayout/widget/DrawerLayout;

    if-eqz v5, :cond_28

    .line 56
    invoke-static {v4}, Lc/b/a/h;->a(Landroid/view/View;)Z

    move-result v5

    if-eqz v5, :cond_28

    return v2

    .line 57
    :cond_28
    invoke-virtual {v4}, Landroid/view/View;->getFitsSystemWindows()Z

    move-result v4

    if-eqz v4, :cond_2f

    return v2

    :cond_2f
    add-int/lit8 v3, v3, 0x1

    goto :goto_17

    :cond_32
    return v0
.end method

.method public static b(Landroid/app/Activity;)Lc/b/a/h;
    .registers 2

    .line 1
    invoke-static {}, Lc/b/a/h;->K()Lc/b/a/r;

    move-result-object v0

    invoke-virtual {v0, p0}, Lc/b/a/r;->a(Landroid/app/Activity;)Lc/b/a/h;

    move-result-object p0

    return-object p0
.end method

.method public static varargs b(Landroid/app/Activity;I[Landroid/view/View;)V
    .registers 11

    .line 21
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_78

    if-nez p0, :cond_9

    return-void

    :cond_9
    const/4 p0, 0x0

    if-gez p1, :cond_d

    const/4 p1, 0x0

    .line 22
    :cond_d
    array-length v0, p2

    const/4 v1, 0x0

    :goto_f
    if-ge v1, v0, :cond_78

    aget-object v2, p2, v1

    if-nez v2, :cond_16

    goto :goto_75

    .line 23
    :cond_16
    sget v3, Lc/b/a/q;->immersion_fits_layout_overlap:I

    invoke-virtual {v2, v3}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    if-nez v3, :cond_24

    .line 24
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 25
    :cond_24
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-eq v4, p1, :cond_75

    .line 26
    sget v4, Lc/b/a/q;->immersion_fits_layout_overlap:I

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 27
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    const/4 v5, -0x1

    const/4 v6, -0x2

    if-nez v4, :cond_40

    .line 28
    new-instance v4, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v4, v5, v6}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 29
    :cond_40
    iget v7, v4, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v7, v6, :cond_6d

    if-ne v7, v5, :cond_47

    goto :goto_6d

    .line 30
    :cond_47
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v5

    sub-int v5, p1, v5

    add-int/2addr v7, v5

    iput v7, v4, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 31
    invoke-virtual {v2}, Landroid/view/View;->getPaddingLeft()I

    move-result v5

    invoke-virtual {v2}, Landroid/view/View;->getPaddingTop()I

    move-result v6

    add-int/2addr v6, p1

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    sub-int/2addr v6, v3

    .line 32
    invoke-virtual {v2}, Landroid/view/View;->getPaddingRight()I

    move-result v3

    invoke-virtual {v2}, Landroid/view/View;->getPaddingBottom()I

    move-result v7

    .line 33
    invoke-virtual {v2, v5, v6, v3, v7}, Landroid/view/View;->setPadding(IIII)V

    .line 34
    invoke-virtual {v2, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_75

    .line 35
    :cond_6d
    :goto_6d
    new-instance v5, Lc/b/a/h$a;

    invoke-direct {v5, v4, v2, p1, v3}, Lc/b/a/h$a;-><init>(Landroid/view/ViewGroup$LayoutParams;Landroid/view/View;ILjava/lang/Integer;)V

    invoke-virtual {v2, v5}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    :cond_75
    :goto_75
    add-int/lit8 v1, v1, 0x1

    goto :goto_f

    :cond_78
    return-void
.end method

.method public static varargs c(Landroid/app/Activity;I[Landroid/view/View;)V
    .registers 11

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_59

    if-nez p0, :cond_9

    return-void

    :cond_9
    const/4 p0, 0x0

    if-gez p1, :cond_d

    const/4 p1, 0x0

    .line 2
    :cond_d
    array-length v0, p2

    const/4 v1, 0x0

    :goto_f
    if-ge v1, v0, :cond_59

    aget-object v2, p2, v1

    if-nez v2, :cond_16

    goto :goto_56

    .line 3
    :cond_16
    sget v3, Lc/b/a/q;->immersion_fits_layout_overlap:I

    invoke-virtual {v2, v3}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    if-nez v3, :cond_24

    .line 4
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 5
    :cond_24
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-eq v4, p1, :cond_56

    .line 6
    sget v4, Lc/b/a/q;->immersion_fits_layout_overlap:I

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 7
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    if-nez v4, :cond_40

    .line 8
    new-instance v4, Landroid/view/ViewGroup$MarginLayoutParams;

    const/4 v5, -0x1

    const/4 v6, -0x2

    invoke-direct {v4, v5, v6}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 9
    :cond_40
    check-cast v4, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 10
    iget v5, v4, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    iget v6, v4, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    add-int/2addr v6, p1

    .line 11
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    sub-int/2addr v6, v3

    iget v3, v4, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    iget v7, v4, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 12
    invoke-virtual {v4, v5, v6, v3, v7}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 13
    invoke-virtual {v2, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_56
    :goto_56
    add-int/lit8 v1, v1, 0x1

    goto :goto_f

    :cond_59
    return-void
.end method


# virtual methods
.method public A()V
    .registers 4

    .line 1
    invoke-virtual {p0}, Lc/b/a/h;->b()V

    .line 2
    iget-boolean v0, p0, Lc/b/a/h;->r:Z

    if-eqz v0, :cond_1a

    iget-object v0, p0, Lc/b/a/h;->o:Lc/b/a/h;

    if-eqz v0, :cond_1a

    .line 3
    iget-object v1, v0, Lc/b/a/h;->s:Lc/b/a/c;

    iget-boolean v2, v0, Lc/b/a/h;->B:Z

    iput-boolean v2, v1, Lc/b/a/c;->J:Z

    .line 4
    iget-object v1, v1, Lc/b/a/c;->q:Lc/b/a/b;

    sget-object v2, Lc/b/a/b;->FLAG_SHOW_BAR:Lc/b/a/b;

    if-eq v1, v2, :cond_1a

    .line 5
    invoke-virtual {v0}, Lc/b/a/h;->D()V

    :cond_1a
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Lc/b/a/h;->z:Z

    return-void
.end method

.method public B()V
    .registers 3

    .line 1
    iget-boolean v0, p0, Lc/b/a/h;->p:Z

    if-nez v0, :cond_27

    iget-boolean v0, p0, Lc/b/a/h;->z:Z

    if-eqz v0, :cond_27

    iget-object v0, p0, Lc/b/a/h;->s:Lc/b/a/c;

    if-eqz v0, :cond_27

    .line 2
    invoke-static {}, Lc/b/a/m;->h()Z

    move-result v0

    if-eqz v0, :cond_1c

    iget-object v0, p0, Lc/b/a/h;->s:Lc/b/a/c;

    iget-boolean v0, v0, Lc/b/a/c;->N:Z

    if-eqz v0, :cond_1c

    .line 3
    invoke-virtual {p0}, Lc/b/a/h;->w()V

    goto :goto_27

    .line 4
    :cond_1c
    iget-object v0, p0, Lc/b/a/h;->s:Lc/b/a/c;

    iget-object v0, v0, Lc/b/a/c;->q:Lc/b/a/b;

    sget-object v1, Lc/b/a/b;->FLAG_SHOW_BAR:Lc/b/a/b;

    if-eq v0, v1, :cond_27

    .line 5
    invoke-virtual {p0}, Lc/b/a/h;->D()V

    :cond_27
    :goto_27
    return-void
.end method

.method public final C()V
    .registers 2

    .line 1
    invoke-virtual {p0}, Lc/b/a/h;->I()V

    .line 2
    invoke-virtual {p0}, Lc/b/a/h;->k()V

    .line 3
    iget-boolean v0, p0, Lc/b/a/h;->p:Z

    if-nez v0, :cond_13

    invoke-static {}, Lc/b/a/m;->h()Z

    move-result v0

    if-eqz v0, :cond_13

    .line 4
    invoke-virtual {p0}, Lc/b/a/h;->j()V

    :cond_13
    return-void
.end method

.method public D()V
    .registers 4

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x100

    const/16 v2, 0x15

    if-lt v0, v2, :cond_1e

    invoke-static {}, Lc/b/a/m;->h()Z

    move-result v0

    if-nez v0, :cond_1e

    .line 2
    invoke-virtual {p0}, Lc/b/a/h;->f()V

    .line 3
    invoke-virtual {p0, v1}, Lc/b/a/h;->b(I)I

    move-result v0

    .line 4
    invoke-virtual {p0, v0}, Lc/b/a/h;->f(I)I

    move-result v0

    .line 5
    invoke-virtual {p0, v0}, Lc/b/a/h;->e(I)I

    move-result v1

    goto :goto_21

    .line 6
    :cond_1e
    invoke-virtual {p0}, Lc/b/a/h;->x()V

    .line 7
    :goto_21
    invoke-virtual {p0, v1}, Lc/b/a/h;->a(I)I

    move-result v0

    .line 8
    iget-object v1, p0, Lc/b/a/h;->m:Landroid/view/ViewGroup;

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->setSystemUiVisibility(I)V

    .line 9
    invoke-virtual {p0}, Lc/b/a/h;->E()V

    .line 10
    iget-object v0, p0, Lc/b/a/h;->s:Lc/b/a/c;

    iget-object v0, v0, Lc/b/a/c;->Q:Lc/b/a/p;

    if-eqz v0, :cond_40

    .line 11
    invoke-static {}, Lc/b/a/k;->a()Lc/b/a/k;

    move-result-object v0

    iget-object v1, p0, Lc/b/a/h;->h:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    invoke-virtual {v0, v1}, Lc/b/a/k;->a(Landroid/app/Application;)V

    :cond_40
    return-void
.end method

.method public final E()V
    .registers 4

    .line 1
    invoke-static {}, Lc/b/a/m;->l()Z

    move-result v0

    if-eqz v0, :cond_20

    .line 2
    iget-object v0, p0, Lc/b/a/h;->l:Landroid/view/Window;

    iget-object v1, p0, Lc/b/a/h;->s:Lc/b/a/c;

    iget-boolean v1, v1, Lc/b/a/c;->r:Z

    const-string v2, "EXTRA_FLAG_STATUS_BAR_DARK_MODE"

    invoke-static {v0, v2, v1}, Lc/b/a/s;->a(Landroid/view/Window;Ljava/lang/String;Z)V

    .line 3
    iget-object v0, p0, Lc/b/a/h;->s:Lc/b/a/c;

    iget-boolean v1, v0, Lc/b/a/c;->L:Z

    if-eqz v1, :cond_20

    .line 4
    iget-object v1, p0, Lc/b/a/h;->l:Landroid/view/Window;

    iget-boolean v0, v0, Lc/b/a/c;->s:Z

    const-string v2, "EXTRA_FLAG_NAVIGATION_BAR_DARK_MODE"

    invoke-static {v1, v2, v0}, Lc/b/a/s;->a(Landroid/view/Window;Ljava/lang/String;Z)V

    .line 5
    :cond_20
    invoke-static {}, Lc/b/a/m;->j()Z

    move-result v0

    if-eqz v0, :cond_39

    .line 6
    iget-object v0, p0, Lc/b/a/h;->s:Lc/b/a/c;

    iget v1, v0, Lc/b/a/c;->G:I

    if-eqz v1, :cond_32

    .line 7
    iget-object v0, p0, Lc/b/a/h;->h:Landroid/app/Activity;

    invoke-static {v0, v1}, Lc/b/a/s;->a(Landroid/app/Activity;I)V

    goto :goto_39

    .line 8
    :cond_32
    iget-object v1, p0, Lc/b/a/h;->h:Landroid/app/Activity;

    iget-boolean v0, v0, Lc/b/a/c;->r:Z

    invoke-static {v1, v0}, Lc/b/a/s;->a(Landroid/app/Activity;Z)V

    :cond_39
    :goto_39
    return-void
.end method

.method public final F()V
    .registers 5

    .line 1
    iget-object v0, p0, Lc/b/a/h;->m:Landroid/view/ViewGroup;

    sget v1, Lc/b/a/e;->b:I

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_1b

    .line 2
    new-instance v0, Landroid/view/View;

    iget-object v1, p0, Lc/b/a/h;->h:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 3
    sget v1, Lc/b/a/e;->b:I

    invoke-virtual {v0, v1}, Landroid/view/View;->setId(I)V

    .line 4
    iget-object v1, p0, Lc/b/a/h;->m:Landroid/view/ViewGroup;

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 5
    :cond_1b
    iget-object v1, p0, Lc/b/a/h;->t:Lc/b/a/a;

    invoke-virtual {v1}, Lc/b/a/a;->f()Z

    move-result v1

    const/4 v2, -0x1

    if-eqz v1, :cond_34

    .line 6
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    iget-object v3, p0, Lc/b/a/h;->t:Lc/b/a/a;

    invoke-virtual {v3}, Lc/b/a/a;->b()I

    move-result v3

    invoke-direct {v1, v2, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    const/16 v2, 0x50

    .line 7
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    goto :goto_44

    .line 8
    :cond_34
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    iget-object v3, p0, Lc/b/a/h;->t:Lc/b/a/a;

    invoke-virtual {v3}, Lc/b/a/a;->c()I

    move-result v3

    invoke-direct {v1, v3, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    const v2, 0x800005

    .line 9
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 10
    :goto_44
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 11
    iget-object v1, p0, Lc/b/a/h;->s:Lc/b/a/c;

    iget v2, v1, Lc/b/a/c;->i:I

    iget v3, v1, Lc/b/a/c;->z:I

    iget v1, v1, Lc/b/a/c;->m:F

    invoke-static {v2, v3, v1}, Lb/h/f/a;->a(IIF)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 12
    iget-object v1, p0, Lc/b/a/h;->s:Lc/b/a/c;

    iget-boolean v2, v1, Lc/b/a/c;->L:Z

    if-eqz v2, :cond_69

    iget-boolean v2, v1, Lc/b/a/c;->M:Z

    if-eqz v2, :cond_69

    iget-boolean v1, v1, Lc/b/a/c;->p:Z

    if-nez v1, :cond_69

    const/4 v1, 0x0

    .line 13
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_6e

    :cond_69
    const/16 v1, 0x8

    .line 14
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :goto_6e
    return-void
.end method

.method public final G()V
    .registers 6

    .line 1
    iget-object v0, p0, Lc/b/a/h;->m:Landroid/view/ViewGroup;

    sget v1, Lc/b/a/e;->a:I

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_32

    .line 2
    new-instance v0, Landroid/view/View;

    iget-object v2, p0, Lc/b/a/h;->h:Landroid/app/Activity;

    invoke-direct {v0, v2}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 3
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v3, -0x1

    iget-object v4, p0, Lc/b/a/h;->t:Lc/b/a/a;

    .line 4
    invoke-virtual {v4}, Lc/b/a/a;->d()I

    move-result v4

    invoke-direct {v2, v3, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    const/16 v3, 0x30

    .line 5
    iput v3, v2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 6
    invoke-virtual {v0, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 7
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 8
    sget v2, Lc/b/a/e;->a:I

    invoke-virtual {v0, v2}, Landroid/view/View;->setId(I)V

    .line 9
    iget-object v2, p0, Lc/b/a/h;->m:Landroid/view/ViewGroup;

    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 10
    :cond_32
    iget-object v2, p0, Lc/b/a/h;->s:Lc/b/a/c;

    iget-boolean v3, v2, Lc/b/a/c;->x:Z

    if-eqz v3, :cond_46

    .line 11
    iget v1, v2, Lc/b/a/c;->h:I

    iget v3, v2, Lc/b/a/c;->y:I

    iget v2, v2, Lc/b/a/c;->k:F

    invoke-static {v1, v3, v2}, Lb/h/f/a;->a(IIF)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    goto :goto_51

    .line 12
    :cond_46
    iget v3, v2, Lc/b/a/c;->h:I

    iget v2, v2, Lc/b/a/c;->k:F

    invoke-static {v3, v1, v2}, Lb/h/f/a;->a(IIF)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    :goto_51
    return-void
.end method

.method public final H()V
    .registers 8

    .line 1
    iget-object v0, p0, Lc/b/a/h;->s:Lc/b/a/c;

    iget-object v0, v0, Lc/b/a/c;->A:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    if-eqz v0, :cond_9b

    .line 2
    iget-object v0, p0, Lc/b/a/h;->s:Lc/b/a/c;

    iget-object v0, v0, Lc/b/a/c;->A:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    .line 3
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_16
    :goto_16
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_9b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 4
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    .line 5
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    .line 6
    iget-object v3, p0, Lc/b/a/h;->s:Lc/b/a/c;

    iget v3, v3, Lc/b/a/c;->h:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 7
    iget-object v4, p0, Lc/b/a/h;->s:Lc/b/a/c;

    iget v4, v4, Lc/b/a/c;->y:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    .line 8
    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_46
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_62

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 9
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    .line 10
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    move-object v6, v4

    move-object v4, v3

    move-object v3, v6

    goto :goto_46

    :cond_62
    if-eqz v2, :cond_16

    .line 11
    iget-object v1, p0, Lc/b/a/h;->s:Lc/b/a/c;

    iget v1, v1, Lc/b/a/c;->B:F

    const/4 v5, 0x0

    sub-float/2addr v1, v5

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    cmpl-float v1, v1, v5

    if-nez v1, :cond_86

    .line 12
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v3

    iget-object v4, p0, Lc/b/a/h;->s:Lc/b/a/c;

    iget v4, v4, Lc/b/a/c;->k:F

    invoke-static {v1, v3, v4}, Lb/h/f/a;->a(IIF)I

    move-result v1

    invoke-virtual {v2, v1}, Landroid/view/View;->setBackgroundColor(I)V

    goto :goto_16

    .line 13
    :cond_86
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v3

    iget-object v4, p0, Lc/b/a/h;->s:Lc/b/a/c;

    iget v4, v4, Lc/b/a/c;->B:F

    invoke-static {v1, v3, v4}, Lb/h/f/a;->a(IIF)I

    move-result v1

    invoke-virtual {v2, v1}, Landroid/view/View;->setBackgroundColor(I)V

    goto/16 :goto_16

    :cond_9b
    return-void
.end method

.method public final I()V
    .registers 3

    .line 1
    new-instance v0, Lc/b/a/a;

    iget-object v1, p0, Lc/b/a/h;->h:Landroid/app/Activity;

    invoke-direct {v0, v1}, Lc/b/a/a;-><init>(Landroid/app/Activity;)V

    iput-object v0, p0, Lc/b/a/h;->t:Lc/b/a/a;

    .line 2
    iget-boolean v0, p0, Lc/b/a/h;->z:Z

    if-eqz v0, :cond_11

    iget-boolean v0, p0, Lc/b/a/h;->A:Z

    if-eqz v0, :cond_19

    .line 3
    :cond_11
    iget-object v0, p0, Lc/b/a/h;->t:Lc/b/a/a;

    invoke-virtual {v0}, Lc/b/a/a;->a()I

    move-result v0

    iput v0, p0, Lc/b/a/h;->w:I

    :cond_19
    return-void
.end method

.method public final J()V
    .registers 3

    .line 1
    invoke-virtual {p0}, Lc/b/a/h;->a()V

    .line 2
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_27

    .line 3
    invoke-virtual {p0}, Lc/b/a/h;->I()V

    .line 4
    iget-object v0, p0, Lc/b/a/h;->o:Lc/b/a/h;

    if-eqz v0, :cond_27

    .line 5
    iget-boolean v1, p0, Lc/b/a/h;->p:Z

    if-eqz v1, :cond_18

    .line 6
    iget-object v1, p0, Lc/b/a/h;->s:Lc/b/a/c;

    iput-object v1, v0, Lc/b/a/h;->s:Lc/b/a/c;

    .line 7
    :cond_18
    iget-boolean v0, p0, Lc/b/a/h;->r:Z

    if-eqz v0, :cond_27

    .line 8
    iget-object v0, p0, Lc/b/a/h;->o:Lc/b/a/h;

    iget-boolean v1, v0, Lc/b/a/h;->B:Z

    if-eqz v1, :cond_27

    .line 9
    iget-object v0, v0, Lc/b/a/h;->s:Lc/b/a/c;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lc/b/a/c;->J:Z

    :cond_27
    return-void
.end method

.method public final a(I)I
    .registers 4

    .line 10
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_2a

    .line 11
    sget-object v0, Lc/b/a/h$b;->a:[I

    iget-object v1, p0, Lc/b/a/h;->s:Lc/b/a/c;

    iget-object v1, v1, Lc/b/a/c;->q:Lc/b/a/b;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_28

    const/4 v1, 0x2

    if-eq v0, v1, :cond_25

    const/4 v1, 0x3

    if-eq v0, v1, :cond_22

    const/4 v1, 0x4

    if-eq v0, v1, :cond_1f

    goto :goto_2a

    :cond_1f
    or-int/lit8 p1, p1, 0x0

    goto :goto_2a

    :cond_22
    or-int/lit16 p1, p1, 0x202

    goto :goto_2a

    :cond_25
    or-int/lit16 p1, p1, 0x404

    goto :goto_2a

    :cond_28
    or-int/lit16 p1, p1, 0x206

    :cond_2a
    :goto_2a
    or-int/lit16 p1, p1, 0x1000

    return p1
.end method

.method public a(ZF)Lc/b/a/h;
    .registers 4

    .line 64
    iget-object v0, p0, Lc/b/a/h;->s:Lc/b/a/c;

    iput-boolean p1, v0, Lc/b/a/c;->t:Z

    .line 65
    iput p2, v0, Lc/b/a/c;->v:F

    .line 66
    iput-boolean p1, v0, Lc/b/a/c;->u:Z

    .line 67
    iput p2, v0, Lc/b/a/c;->w:F

    return-object p0
.end method

.method public final a()V
    .registers 6

    .line 6
    iget-object v0, p0, Lc/b/a/h;->s:Lc/b/a/c;

    iget-boolean v1, v0, Lc/b/a/c;->t:Z

    const/4 v2, 0x1

    const/4 v3, 0x0

    const v4, -0x454546

    if-eqz v1, :cond_1b

    iget v0, v0, Lc/b/a/c;->h:I

    if-eqz v0, :cond_1b

    if-le v0, v4, :cond_13

    const/4 v0, 0x1

    goto :goto_14

    :cond_13
    const/4 v0, 0x0

    .line 7
    :goto_14
    iget-object v1, p0, Lc/b/a/h;->s:Lc/b/a/c;

    iget v1, v1, Lc/b/a/c;->v:F

    invoke-virtual {p0, v0, v1}, Lc/b/a/h;->c(ZF)Lc/b/a/h;

    .line 8
    :cond_1b
    iget-object v0, p0, Lc/b/a/h;->s:Lc/b/a/c;

    iget-boolean v1, v0, Lc/b/a/c;->u:Z

    if-eqz v1, :cond_30

    iget v0, v0, Lc/b/a/c;->i:I

    if-eqz v0, :cond_30

    if-le v0, v4, :cond_28

    goto :goto_29

    :cond_28
    const/4 v2, 0x0

    .line 9
    :goto_29
    iget-object v0, p0, Lc/b/a/h;->s:Lc/b/a/c;

    iget v0, v0, Lc/b/a/c;->w:F

    invoke-virtual {p0, v2, v0}, Lc/b/a/h;->b(ZF)Lc/b/a/h;

    :cond_30
    return-void
.end method

.method public final a(IIII)V
    .registers 6

    .line 33
    iget-object v0, p0, Lc/b/a/h;->n:Landroid/view/ViewGroup;

    if-eqz v0, :cond_7

    .line 34
    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/view/ViewGroup;->setPadding(IIII)V

    .line 35
    :cond_7
    iput p1, p0, Lc/b/a/h;->C:I

    .line 36
    iput p2, p0, Lc/b/a/h;->D:I

    .line 37
    iput p3, p0, Lc/b/a/h;->E:I

    .line 38
    iput p4, p0, Lc/b/a/h;->F:I

    return-void
.end method

.method public a(Landroid/content/res/Configuration;)V
    .registers 3

    .line 1
    invoke-static {}, Lc/b/a/m;->h()Z

    move-result p1

    if-nez p1, :cond_11

    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x13

    if-ne p1, v0, :cond_d

    goto :goto_11

    .line 2
    :cond_d
    invoke-virtual {p0}, Lc/b/a/h;->g()V

    goto :goto_26

    .line 3
    :cond_11
    :goto_11
    iget-boolean p1, p0, Lc/b/a/h;->z:Z

    if-eqz p1, :cond_23

    iget-boolean p1, p0, Lc/b/a/h;->p:Z

    if-nez p1, :cond_23

    iget-object p1, p0, Lc/b/a/h;->s:Lc/b/a/c;

    iget-boolean p1, p1, Lc/b/a/c;->M:Z

    if-eqz p1, :cond_23

    .line 4
    invoke-virtual {p0}, Lc/b/a/h;->w()V

    goto :goto_26

    .line 5
    :cond_23
    invoke-virtual {p0}, Lc/b/a/h;->g()V

    :goto_26
    return-void
.end method

.method public final a(Landroid/view/Window;)V
    .registers 3

    .line 60
    iput-object p1, p0, Lc/b/a/h;->l:Landroid/view/Window;

    .line 61
    new-instance p1, Lc/b/a/c;

    invoke-direct {p1}, Lc/b/a/c;-><init>()V

    iput-object p1, p0, Lc/b/a/h;->s:Lc/b/a/c;

    .line 62
    iget-object p1, p0, Lc/b/a/h;->l:Landroid/view/Window;

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup;

    iput-object p1, p0, Lc/b/a/h;->m:Landroid/view/ViewGroup;

    const v0, 0x1020002

    .line 63
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup;

    iput-object p1, p0, Lc/b/a/h;->n:Landroid/view/ViewGroup;

    return-void
.end method

.method public a(Z)V
    .registers 7

    .line 12
    iget-object v0, p0, Lc/b/a/h;->m:Landroid/view/ViewGroup;

    sget v1, Lc/b/a/e;->b:I

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_9a

    .line 13
    new-instance v1, Lc/b/a/a;

    iget-object v2, p0, Lc/b/a/h;->h:Landroid/app/Activity;

    invoke-direct {v1, v2}, Lc/b/a/a;-><init>(Landroid/app/Activity;)V

    iput-object v1, p0, Lc/b/a/h;->t:Lc/b/a/a;

    .line 14
    iget-object v1, p0, Lc/b/a/h;->n:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getPaddingBottom()I

    move-result v1

    iget-object v2, p0, Lc/b/a/h;->n:Landroid/view/ViewGroup;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->getPaddingRight()I

    move-result v2

    const/4 v3, 0x0

    if-nez p1, :cond_2a

    const/16 p1, 0x8

    .line 15
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    :goto_27
    const/4 v1, 0x0

    const/4 v2, 0x0

    goto :goto_91

    .line 16
    :cond_2a
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 17
    iget-object p1, p0, Lc/b/a/h;->m:Landroid/view/ViewGroup;

    const v4, 0x1020002

    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-static {p1}, Lc/b/a/h;->a(Landroid/view/View;)Z

    move-result p1

    if-eqz p1, :cond_3d

    goto :goto_27

    .line 18
    :cond_3d
    iget p1, p0, Lc/b/a/h;->u:I

    if-nez p1, :cond_49

    .line 19
    iget-object p1, p0, Lc/b/a/h;->t:Lc/b/a/a;

    invoke-virtual {p1}, Lc/b/a/a;->b()I

    move-result p1

    iput p1, p0, Lc/b/a/h;->u:I

    .line 20
    :cond_49
    iget p1, p0, Lc/b/a/h;->v:I

    if-nez p1, :cond_55

    .line 21
    iget-object p1, p0, Lc/b/a/h;->t:Lc/b/a/a;

    invoke-virtual {p1}, Lc/b/a/a;->c()I

    move-result p1

    iput p1, p0, Lc/b/a/h;->v:I

    .line 22
    :cond_55
    iget-object p1, p0, Lc/b/a/h;->s:Lc/b/a/c;

    iget-boolean p1, p1, Lc/b/a/c;->p:Z

    if-nez p1, :cond_91

    .line 23
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 24
    iget-object v1, p0, Lc/b/a/h;->t:Lc/b/a/a;

    invoke-virtual {v1}, Lc/b/a/a;->f()Z

    move-result v1

    if-eqz v1, :cond_7b

    const/16 v1, 0x50

    .line 25
    iput v1, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 26
    iget v1, p0, Lc/b/a/h;->u:I

    iput v1, p1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 27
    iget-object v2, p0, Lc/b/a/h;->s:Lc/b/a/c;

    iget-boolean v2, v2, Lc/b/a/c;->o:Z

    if-nez v2, :cond_78

    goto :goto_79

    :cond_78
    const/4 v1, 0x0

    :goto_79
    const/4 v2, 0x0

    goto :goto_8e

    :cond_7b
    const v1, 0x800005

    .line 28
    iput v1, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 29
    iget v1, p0, Lc/b/a/h;->v:I

    iput v1, p1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 30
    iget-object v2, p0, Lc/b/a/h;->s:Lc/b/a/c;

    iget-boolean v2, v2, Lc/b/a/c;->o:Z

    if-nez v2, :cond_8b

    goto :goto_8c

    :cond_8b
    const/4 v1, 0x0

    :goto_8c
    move v2, v1

    const/4 v1, 0x0

    .line 31
    :goto_8e
    invoke-virtual {v0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 32
    :cond_91
    :goto_91
    iget-object p1, p0, Lc/b/a/h;->n:Landroid/view/ViewGroup;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getPaddingTop()I

    move-result p1

    invoke-virtual {p0, v3, p1, v2, v1}, Lc/b/a/h;->a(IIII)V

    :cond_9a
    return-void
.end method

.method public final b(I)I
    .registers 6

    .line 2
    iget-boolean v0, p0, Lc/b/a/h;->z:Z

    if-nez v0, :cond_e

    .line 3
    iget-object v0, p0, Lc/b/a/h;->s:Lc/b/a/c;

    iget-object v1, p0, Lc/b/a/h;->l:Landroid/view/Window;

    invoke-virtual {v1}, Landroid/view/Window;->getNavigationBarColor()I

    move-result v1

    iput v1, v0, Lc/b/a/c;->j:I

    :cond_e
    or-int/lit16 p1, p1, 0x400

    .line 4
    iget-object v0, p0, Lc/b/a/h;->s:Lc/b/a/c;

    iget-boolean v1, v0, Lc/b/a/c;->o:Z

    if-eqz v1, :cond_1c

    iget-boolean v0, v0, Lc/b/a/c;->L:Z

    if-eqz v0, :cond_1c

    or-int/lit16 p1, p1, 0x200

    .line 5
    :cond_1c
    iget-object v0, p0, Lc/b/a/h;->l:Landroid/view/Window;

    const/high16 v1, 0x4000000

    invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V

    .line 6
    iget-object v0, p0, Lc/b/a/h;->t:Lc/b/a/a;

    invoke-virtual {v0}, Lc/b/a/a;->e()Z

    move-result v0

    if-eqz v0, :cond_32

    .line 7
    iget-object v0, p0, Lc/b/a/h;->l:Landroid/view/Window;

    const/high16 v1, 0x8000000

    invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V

    .line 8
    :cond_32
    iget-object v0, p0, Lc/b/a/h;->l:Landroid/view/Window;

    const/high16 v1, -0x80000000

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 9
    iget-object v0, p0, Lc/b/a/h;->s:Lc/b/a/c;

    iget-boolean v1, v0, Lc/b/a/c;->x:Z

    if-eqz v1, :cond_4f

    .line 10
    iget-object v1, p0, Lc/b/a/h;->l:Landroid/view/Window;

    iget v2, v0, Lc/b/a/c;->h:I

    iget v3, v0, Lc/b/a/c;->y:I

    iget v0, v0, Lc/b/a/c;->k:F

    invoke-static {v2, v3, v0}, Lb/h/f/a;->a(IIF)I

    move-result v0

    invoke-virtual {v1, v0}, Landroid/view/Window;->setStatusBarColor(I)V

    goto :goto_5d

    .line 11
    :cond_4f
    iget-object v1, p0, Lc/b/a/h;->l:Landroid/view/Window;

    iget v2, v0, Lc/b/a/c;->h:I

    const/4 v3, 0x0

    iget v0, v0, Lc/b/a/c;->k:F

    invoke-static {v2, v3, v0}, Lb/h/f/a;->a(IIF)I

    move-result v0

    invoke-virtual {v1, v0}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 12
    :goto_5d
    iget-object v0, p0, Lc/b/a/h;->s:Lc/b/a/c;

    iget-boolean v1, v0, Lc/b/a/c;->L:Z

    if-eqz v1, :cond_73

    .line 13
    iget-object v1, p0, Lc/b/a/h;->l:Landroid/view/Window;

    iget v2, v0, Lc/b/a/c;->i:I

    iget v3, v0, Lc/b/a/c;->z:I

    iget v0, v0, Lc/b/a/c;->m:F

    invoke-static {v2, v3, v0}, Lb/h/f/a;->a(IIF)I

    move-result v0

    invoke-virtual {v1, v0}, Landroid/view/Window;->setNavigationBarColor(I)V

    goto :goto_7a

    .line 14
    :cond_73
    iget-object v1, p0, Lc/b/a/h;->l:Landroid/view/Window;

    iget v0, v0, Lc/b/a/c;->j:I

    invoke-virtual {v1, v0}, Landroid/view/Window;->setNavigationBarColor(I)V

    :goto_7a
    return p1
.end method

.method public b(Z)Lc/b/a/h;
    .registers 3

    const v0, 0x3e4ccccd    # 0.2f

    .line 36
    invoke-virtual {p0, p1, v0}, Lc/b/a/h;->c(ZF)Lc/b/a/h;

    return-object p0
.end method

.method public b(ZF)Lc/b/a/h;
    .registers 4

    .line 37
    iget-object v0, p0, Lc/b/a/h;->s:Lc/b/a/c;

    iput-boolean p1, v0, Lc/b/a/c;->s:Z

    if-eqz p1, :cond_11

    .line 38
    invoke-static {}, Lc/b/a/h;->L()Z

    move-result p1

    if-nez p1, :cond_11

    .line 39
    iget-object p1, p0, Lc/b/a/h;->s:Lc/b/a/c;

    iput p2, p1, Lc/b/a/c;->m:F

    goto :goto_17

    .line 40
    :cond_11
    iget-object p1, p0, Lc/b/a/h;->s:Lc/b/a/c;

    iget p2, p1, Lc/b/a/c;->n:F

    iput p2, p1, Lc/b/a/c;->m:F

    :goto_17
    return-object p0
.end method

.method public final b()V
    .registers 3

    .line 15
    iget-object v0, p0, Lc/b/a/h;->h:Landroid/app/Activity;

    if-eqz v0, :cond_20

    .line 16
    iget-object v0, p0, Lc/b/a/h;->x:Lc/b/a/g;

    if-eqz v0, :cond_e

    .line 17
    invoke-virtual {v0}, Lc/b/a/g;->a()V

    const/4 v0, 0x0

    .line 18
    iput-object v0, p0, Lc/b/a/h;->x:Lc/b/a/g;

    .line 19
    :cond_e
    invoke-static {}, Lc/b/a/f;->a()Lc/b/a/f;

    move-result-object v0

    invoke-virtual {v0, p0}, Lc/b/a/f;->b(Lc/b/a/i;)V

    .line 20
    invoke-static {}, Lc/b/a/k;->a()Lc/b/a/k;

    move-result-object v0

    iget-object v1, p0, Lc/b/a/h;->s:Lc/b/a/c;

    iget-object v1, v1, Lc/b/a/c;->Q:Lc/b/a/p;

    invoke-virtual {v0, v1}, Lc/b/a/k;->a(Lc/b/a/p;)V

    :cond_20
    return-void
.end method

.method public c(I)Lc/b/a/h;
    .registers 3

    .line 18
    iget-object v0, p0, Lc/b/a/h;->h:Landroid/app/Activity;

    invoke-static {v0, p1}, Lb/h/e/a;->a(Landroid/content/Context;I)I

    move-result p1

    invoke-virtual {p0, p1}, Lc/b/a/h;->d(I)Lc/b/a/h;

    return-object p0
.end method

.method public c(ZF)Lc/b/a/h;
    .registers 4

    .line 19
    iget-object v0, p0, Lc/b/a/h;->s:Lc/b/a/c;

    iput-boolean p1, v0, Lc/b/a/c;->r:Z

    if-eqz p1, :cond_11

    .line 20
    invoke-static {}, Lc/b/a/h;->M()Z

    move-result p1

    if-nez p1, :cond_11

    .line 21
    iget-object p1, p0, Lc/b/a/h;->s:Lc/b/a/c;

    iput p2, p1, Lc/b/a/c;->k:F

    goto :goto_1b

    .line 22
    :cond_11
    iget-object p1, p0, Lc/b/a/h;->s:Lc/b/a/c;

    iget p2, p1, Lc/b/a/c;->H:I

    iput p2, p1, Lc/b/a/c;->G:I

    .line 23
    iget p2, p1, Lc/b/a/c;->l:F

    iput p2, p1, Lc/b/a/c;->k:F

    :goto_1b
    return-object p0
.end method

.method public final c()V
    .registers 3

    .line 14
    iget-object v0, p0, Lc/b/a/h;->o:Lc/b/a/h;

    if-nez v0, :cond_c

    .line 15
    iget-object v0, p0, Lc/b/a/h;->h:Landroid/app/Activity;

    invoke-static {v0}, Lc/b/a/h;->b(Landroid/app/Activity;)Lc/b/a/h;

    move-result-object v0

    iput-object v0, p0, Lc/b/a/h;->o:Lc/b/a/h;

    .line 16
    :cond_c
    iget-object v0, p0, Lc/b/a/h;->o:Lc/b/a/h;

    if-eqz v0, :cond_17

    iget-boolean v1, v0, Lc/b/a/h;->z:Z

    if-nez v1, :cond_17

    .line 17
    invoke-virtual {v0}, Lc/b/a/h;->w()V

    :cond_17
    return-void
.end method

.method public d(I)Lc/b/a/h;
    .registers 3

    .line 16
    iget-object v0, p0, Lc/b/a/h;->s:Lc/b/a/c;

    iput p1, v0, Lc/b/a/c;->i:I

    return-object p0
.end method

.method public final d()V
    .registers 3

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_55

    .line 2
    iget-boolean v0, p0, Lc/b/a/h;->p:Z

    if-nez v0, :cond_2d

    .line 3
    iget-object v0, p0, Lc/b/a/h;->s:Lc/b/a/c;

    iget-boolean v0, v0, Lc/b/a/c;->J:Z

    if-eqz v0, :cond_25

    .line 4
    iget-object v0, p0, Lc/b/a/h;->x:Lc/b/a/g;

    if-nez v0, :cond_1b

    .line 5
    new-instance v0, Lc/b/a/g;

    invoke-direct {v0, p0}, Lc/b/a/g;-><init>(Lc/b/a/h;)V

    iput-object v0, p0, Lc/b/a/h;->x:Lc/b/a/g;

    .line 6
    :cond_1b
    iget-object v0, p0, Lc/b/a/h;->x:Lc/b/a/g;

    iget-object v1, p0, Lc/b/a/h;->s:Lc/b/a/c;

    iget v1, v1, Lc/b/a/c;->K:I

    invoke-virtual {v0, v1}, Lc/b/a/g;->a(I)V

    goto :goto_55

    .line 7
    :cond_25
    iget-object v0, p0, Lc/b/a/h;->x:Lc/b/a/g;

    if-eqz v0, :cond_55

    .line 8
    invoke-virtual {v0}, Lc/b/a/g;->b()V

    goto :goto_55

    .line 9
    :cond_2d
    iget-object v0, p0, Lc/b/a/h;->o:Lc/b/a/h;

    if-eqz v0, :cond_55

    .line 10
    iget-object v1, v0, Lc/b/a/h;->s:Lc/b/a/c;

    iget-boolean v1, v1, Lc/b/a/c;->J:Z

    if-eqz v1, :cond_4e

    .line 11
    iget-object v1, v0, Lc/b/a/h;->x:Lc/b/a/g;

    if-nez v1, :cond_42

    .line 12
    new-instance v1, Lc/b/a/g;

    invoke-direct {v1, v0}, Lc/b/a/g;-><init>(Lc/b/a/h;)V

    iput-object v1, v0, Lc/b/a/h;->x:Lc/b/a/g;

    .line 13
    :cond_42
    iget-object v0, p0, Lc/b/a/h;->o:Lc/b/a/h;

    iget-object v1, v0, Lc/b/a/h;->x:Lc/b/a/g;

    iget-object v0, v0, Lc/b/a/h;->s:Lc/b/a/c;

    iget v0, v0, Lc/b/a/c;->K:I

    invoke-virtual {v1, v0}, Lc/b/a/g;->a(I)V

    goto :goto_55

    .line 14
    :cond_4e
    iget-object v0, v0, Lc/b/a/h;->x:Lc/b/a/g;

    if-eqz v0, :cond_55

    .line 15
    invoke-virtual {v0}, Lc/b/a/g;->b()V

    :cond_55
    :goto_55
    return-void
.end method

.method public final e(I)I
    .registers 4

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_e

    iget-object v0, p0, Lc/b/a/h;->s:Lc/b/a/c;

    iget-boolean v0, v0, Lc/b/a/c;->s:Z

    if-eqz v0, :cond_e

    or-int/lit8 p1, p1, 0x10

    :cond_e
    return p1
.end method

.method public final e()V
    .registers 6

    .line 2
    iget-object v0, p0, Lc/b/a/h;->s:Lc/b/a/c;

    iget-boolean v0, v0, Lc/b/a/c;->F:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_e

    .line 3
    iget-object v0, p0, Lc/b/a/h;->h:Landroid/app/Activity;

    invoke-static {v0}, Lc/b/a/h;->a(Landroid/app/Activity;)I

    move-result v0

    goto :goto_f

    :cond_e
    const/4 v0, 0x0

    .line 4
    :goto_f
    iget v2, p0, Lc/b/a/h;->y:I

    const/4 v3, 0x1

    if-eq v2, v3, :cond_37

    const/4 v4, 0x2

    if-eq v2, v4, :cond_29

    const/4 v4, 0x3

    if-eq v2, v4, :cond_1b

    goto :goto_44

    .line 5
    :cond_1b
    iget-object v2, p0, Lc/b/a/h;->h:Landroid/app/Activity;

    new-array v3, v3, [Landroid/view/View;

    iget-object v4, p0, Lc/b/a/h;->s:Lc/b/a/c;

    iget-object v4, v4, Lc/b/a/c;->E:Landroid/view/View;

    aput-object v4, v3, v1

    invoke-static {v2, v0, v3}, Lc/b/a/h;->a(Landroid/app/Activity;I[Landroid/view/View;)V

    goto :goto_44

    .line 6
    :cond_29
    iget-object v2, p0, Lc/b/a/h;->h:Landroid/app/Activity;

    new-array v3, v3, [Landroid/view/View;

    iget-object v4, p0, Lc/b/a/h;->s:Lc/b/a/c;

    iget-object v4, v4, Lc/b/a/c;->D:Landroid/view/View;

    aput-object v4, v3, v1

    invoke-static {v2, v0, v3}, Lc/b/a/h;->c(Landroid/app/Activity;I[Landroid/view/View;)V

    goto :goto_44

    .line 7
    :cond_37
    iget-object v2, p0, Lc/b/a/h;->h:Landroid/app/Activity;

    new-array v3, v3, [Landroid/view/View;

    iget-object v4, p0, Lc/b/a/h;->s:Lc/b/a/c;

    iget-object v4, v4, Lc/b/a/c;->D:Landroid/view/View;

    aput-object v4, v3, v1

    invoke-static {v2, v0, v3}, Lc/b/a/h;->b(Landroid/app/Activity;I[Landroid/view/View;)V

    :goto_44
    return-void
.end method

.method public final f(I)I
    .registers 4

    .line 5
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_e

    iget-object v0, p0, Lc/b/a/h;->s:Lc/b/a/c;

    iget-boolean v0, v0, Lc/b/a/c;->r:Z

    if-eqz v0, :cond_e

    or-int/lit16 p1, p1, 0x2000

    :cond_e
    return p1
.end method

.method public final f()V
    .registers 3

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-lt v0, v1, :cond_18

    iget-boolean v0, p0, Lc/b/a/h;->z:Z

    if-nez v0, :cond_18

    .line 2
    iget-object v0, p0, Lc/b/a/h;->l:Landroid/view/Window;

    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    const/4 v1, 0x1

    .line 3
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->layoutInDisplayCutoutMode:I

    .line 4
    iget-object v1, p0, Lc/b/a/h;->l:Landroid/view/Window;

    invoke-virtual {v1, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    :cond_18
    return-void
.end method

.method public final g()V
    .registers 3

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_1a

    const/16 v1, 0x15

    if-lt v0, v1, :cond_14

    .line 2
    invoke-static {}, Lc/b/a/m;->h()Z

    move-result v0

    if-nez v0, :cond_14

    .line 3
    invoke-virtual {p0}, Lc/b/a/h;->h()V

    goto :goto_17

    .line 4
    :cond_14
    invoke-virtual {p0}, Lc/b/a/h;->i()V

    .line 5
    :goto_17
    invoke-virtual {p0}, Lc/b/a/h;->e()V

    :cond_1a
    return-void
.end method

.method public final h()V
    .registers 4

    .line 1
    invoke-virtual {p0}, Lc/b/a/h;->I()V

    .line 2
    iget-object v0, p0, Lc/b/a/h;->m:Landroid/view/ViewGroup;

    const v1, 0x1020002

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Lc/b/a/h;->a(Landroid/view/View;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_17

    .line 3
    invoke-virtual {p0, v1, v1, v1, v1}, Lc/b/a/h;->a(IIII)V

    return-void

    .line 4
    :cond_17
    iget-object v0, p0, Lc/b/a/h;->s:Lc/b/a/c;

    iget-boolean v0, v0, Lc/b/a/c;->C:Z

    if-eqz v0, :cond_29

    iget v0, p0, Lc/b/a/h;->y:I

    const/4 v2, 0x4

    if-ne v0, v2, :cond_29

    .line 5
    iget-object v0, p0, Lc/b/a/h;->t:Lc/b/a/a;

    invoke-virtual {v0}, Lc/b/a/a;->d()I

    move-result v0

    goto :goto_2a

    :cond_29
    const/4 v0, 0x0

    .line 6
    :goto_2a
    iget-object v2, p0, Lc/b/a/h;->s:Lc/b/a/c;

    iget-boolean v2, v2, Lc/b/a/c;->I:Z

    if-eqz v2, :cond_39

    .line 7
    iget-object v0, p0, Lc/b/a/h;->t:Lc/b/a/a;

    invoke-virtual {v0}, Lc/b/a/a;->d()I

    move-result v0

    iget v2, p0, Lc/b/a/h;->w:I

    add-int/2addr v0, v2

    .line 8
    :cond_39
    invoke-virtual {p0, v1, v0, v1, v1}, Lc/b/a/h;->a(IIII)V

    return-void
.end method

.method public final i()V
    .registers 2

    .line 1
    iget-object v0, p0, Lc/b/a/h;->s:Lc/b/a/c;

    iget-boolean v0, v0, Lc/b/a/c;->I:Z

    if-eqz v0, :cond_f

    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lc/b/a/h;->A:Z

    .line 3
    iget-object v0, p0, Lc/b/a/h;->n:Landroid/view/ViewGroup;

    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->post(Ljava/lang/Runnable;)Z

    goto :goto_15

    :cond_f
    const/4 v0, 0x0

    .line 4
    iput-boolean v0, p0, Lc/b/a/h;->A:Z

    .line 5
    invoke-virtual {p0}, Lc/b/a/h;->C()V

    :goto_15
    return-void
.end method

.method public final j()V
    .registers 4

    .line 1
    iget-object v0, p0, Lc/b/a/h;->m:Landroid/view/ViewGroup;

    sget v1, Lc/b/a/e;->b:I

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 2
    iget-object v1, p0, Lc/b/a/h;->s:Lc/b/a/c;

    iget-boolean v2, v1, Lc/b/a/c;->L:Z

    if-eqz v2, :cond_29

    iget-boolean v1, v1, Lc/b/a/c;->M:Z

    if-eqz v1, :cond_29

    if-eqz v0, :cond_35

    .line 3
    invoke-static {}, Lc/b/a/f;->a()Lc/b/a/f;

    move-result-object v0

    invoke-virtual {v0, p0}, Lc/b/a/f;->a(Lc/b/a/i;)V

    .line 4
    invoke-static {}, Lc/b/a/f;->a()Lc/b/a/f;

    move-result-object v0

    iget-object v1, p0, Lc/b/a/h;->h:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    invoke-virtual {v0, v1}, Lc/b/a/f;->a(Landroid/app/Application;)V

    goto :goto_35

    .line 5
    :cond_29
    invoke-static {}, Lc/b/a/f;->a()Lc/b/a/f;

    move-result-object v1

    invoke-virtual {v1, p0}, Lc/b/a/f;->b(Lc/b/a/i;)V

    const/16 v1, 0x8

    .line 6
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_35
    :goto_35
    return-void
.end method

.method public final k()V
    .registers 6

    .line 1
    iget-object v0, p0, Lc/b/a/h;->m:Landroid/view/ViewGroup;

    const v1, 0x1020002

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Lc/b/a/h;->a(Landroid/view/View;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_14

    .line 2
    invoke-virtual {p0, v1, v1, v1, v1}, Lc/b/a/h;->a(IIII)V

    return-void

    .line 3
    :cond_14
    iget-object v0, p0, Lc/b/a/h;->s:Lc/b/a/c;

    iget-boolean v0, v0, Lc/b/a/c;->C:Z

    if-eqz v0, :cond_26

    iget v0, p0, Lc/b/a/h;->y:I

    const/4 v2, 0x4

    if-ne v0, v2, :cond_26

    .line 4
    iget-object v0, p0, Lc/b/a/h;->t:Lc/b/a/a;

    invoke-virtual {v0}, Lc/b/a/a;->d()I

    move-result v0

    goto :goto_27

    :cond_26
    const/4 v0, 0x0

    .line 5
    :goto_27
    iget-object v2, p0, Lc/b/a/h;->s:Lc/b/a/c;

    iget-boolean v2, v2, Lc/b/a/c;->I:Z

    if-eqz v2, :cond_36

    .line 6
    iget-object v0, p0, Lc/b/a/h;->t:Lc/b/a/a;

    invoke-virtual {v0}, Lc/b/a/a;->d()I

    move-result v0

    iget v2, p0, Lc/b/a/h;->w:I

    add-int/2addr v0, v2

    .line 7
    :cond_36
    iget-object v2, p0, Lc/b/a/h;->t:Lc/b/a/a;

    invoke-virtual {v2}, Lc/b/a/a;->e()Z

    move-result v2

    if-eqz v2, :cond_86

    iget-object v2, p0, Lc/b/a/h;->s:Lc/b/a/c;

    iget-boolean v3, v2, Lc/b/a/c;->L:Z

    if-eqz v3, :cond_86

    iget-boolean v3, v2, Lc/b/a/c;->M:Z

    if-eqz v3, :cond_86

    .line 8
    iget-boolean v2, v2, Lc/b/a/c;->o:Z

    if-nez v2, :cond_64

    .line 9
    iget-object v2, p0, Lc/b/a/h;->t:Lc/b/a/a;

    invoke-virtual {v2}, Lc/b/a/a;->f()Z

    move-result v2

    if-eqz v2, :cond_5d

    .line 10
    iget-object v2, p0, Lc/b/a/h;->t:Lc/b/a/a;

    invoke-virtual {v2}, Lc/b/a/a;->b()I

    move-result v2

    move v3, v2

    const/4 v2, 0x0

    goto :goto_66

    .line 11
    :cond_5d
    iget-object v2, p0, Lc/b/a/h;->t:Lc/b/a/a;

    invoke-virtual {v2}, Lc/b/a/a;->c()I

    move-result v2

    goto :goto_65

    :cond_64
    const/4 v2, 0x0

    :goto_65
    const/4 v3, 0x0

    .line 12
    :goto_66
    iget-object v4, p0, Lc/b/a/h;->s:Lc/b/a/c;

    iget-boolean v4, v4, Lc/b/a/c;->p:Z

    if-eqz v4, :cond_77

    .line 13
    iget-object v4, p0, Lc/b/a/h;->t:Lc/b/a/a;

    invoke-virtual {v4}, Lc/b/a/a;->f()Z

    move-result v4

    if-eqz v4, :cond_75

    goto :goto_87

    :cond_75
    const/4 v2, 0x0

    goto :goto_88

    .line 14
    :cond_77
    iget-object v4, p0, Lc/b/a/h;->t:Lc/b/a/a;

    invoke-virtual {v4}, Lc/b/a/a;->f()Z

    move-result v4

    if-nez v4, :cond_88

    .line 15
    iget-object v2, p0, Lc/b/a/h;->t:Lc/b/a/a;

    invoke-virtual {v2}, Lc/b/a/a;->c()I

    move-result v2

    goto :goto_88

    :cond_86
    const/4 v2, 0x0

    :goto_87
    const/4 v3, 0x0

    .line 16
    :cond_88
    :goto_88
    invoke-virtual {p0, v1, v0, v2, v3}, Lc/b/a/h;->a(IIII)V

    return-void
.end method

.method public l()I
    .registers 2

    .line 1
    iget v0, p0, Lc/b/a/h;->w:I

    return v0
.end method

.method public m()Landroid/app/Activity;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/b/a/h;->h:Landroid/app/Activity;

    return-object v0
.end method

.method public n()Lc/b/a/a;
    .registers 3

    .line 1
    iget-object v0, p0, Lc/b/a/h;->t:Lc/b/a/a;

    if-nez v0, :cond_d

    .line 2
    new-instance v0, Lc/b/a/a;

    iget-object v1, p0, Lc/b/a/h;->h:Landroid/app/Activity;

    invoke-direct {v0, v1}, Lc/b/a/a;-><init>(Landroid/app/Activity;)V

    iput-object v0, p0, Lc/b/a/h;->t:Lc/b/a/a;

    .line 3
    :cond_d
    iget-object v0, p0, Lc/b/a/h;->t:Lc/b/a/a;

    return-object v0
.end method

.method public o()Lc/b/a/c;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/b/a/h;->s:Lc/b/a/c;

    return-object v0
.end method

.method public p()Landroid/app/Fragment;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/b/a/h;->j:Landroid/app/Fragment;

    return-object v0
.end method

.method public q()I
    .registers 2

    .line 1
    iget v0, p0, Lc/b/a/h;->F:I

    return v0
.end method

.method public r()I
    .registers 2

    .line 1
    iget v0, p0, Lc/b/a/h;->C:I

    return v0
.end method

.method public run()V
    .registers 1

    .line 1
    invoke-virtual {p0}, Lc/b/a/h;->C()V

    return-void
.end method

.method public s()I
    .registers 2

    .line 1
    iget v0, p0, Lc/b/a/h;->E:I

    return v0
.end method

.method public t()I
    .registers 2

    .line 1
    iget v0, p0, Lc/b/a/h;->D:I

    return v0
.end method

.method public u()Landroidx/fragment/app/Fragment;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/b/a/h;->i:Landroidx/fragment/app/Fragment;

    return-object v0
.end method

.method public v()Landroid/view/Window;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/b/a/h;->l:Landroid/view/Window;

    return-object v0
.end method

.method public w()V
    .registers 3

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_1e

    iget-object v0, p0, Lc/b/a/h;->s:Lc/b/a/c;

    iget-boolean v0, v0, Lc/b/a/c;->O:Z

    if-eqz v0, :cond_1e

    .line 2
    invoke-virtual {p0}, Lc/b/a/h;->J()V

    .line 3
    invoke-virtual {p0}, Lc/b/a/h;->D()V

    .line 4
    invoke-virtual {p0}, Lc/b/a/h;->g()V

    .line 5
    invoke-virtual {p0}, Lc/b/a/h;->d()V

    .line 6
    invoke-virtual {p0}, Lc/b/a/h;->H()V

    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lc/b/a/h;->z:Z

    :cond_1e
    return-void
.end method

.method public final x()V
    .registers 4

    .line 1
    iget-object v0, p0, Lc/b/a/h;->l:Landroid/view/Window;

    const/high16 v1, 0x4000000

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 2
    invoke-virtual {p0}, Lc/b/a/h;->G()V

    .line 3
    iget-object v0, p0, Lc/b/a/h;->t:Lc/b/a/a;

    invoke-virtual {v0}, Lc/b/a/a;->e()Z

    move-result v0

    if-nez v0, :cond_18

    invoke-static {}, Lc/b/a/m;->h()Z

    move-result v0

    if-eqz v0, :cond_4a

    .line 4
    :cond_18
    iget-object v0, p0, Lc/b/a/h;->s:Lc/b/a/c;

    iget-boolean v1, v0, Lc/b/a/c;->L:Z

    const/high16 v2, 0x8000000

    if-eqz v1, :cond_2a

    iget-boolean v0, v0, Lc/b/a/c;->M:Z

    if-eqz v0, :cond_2a

    .line 5
    iget-object v0, p0, Lc/b/a/h;->l:Landroid/view/Window;

    invoke-virtual {v0, v2}, Landroid/view/Window;->addFlags(I)V

    goto :goto_2f

    .line 6
    :cond_2a
    iget-object v0, p0, Lc/b/a/h;->l:Landroid/view/Window;

    invoke-virtual {v0, v2}, Landroid/view/Window;->clearFlags(I)V

    .line 7
    :goto_2f
    iget v0, p0, Lc/b/a/h;->u:I

    if-nez v0, :cond_3b

    .line 8
    iget-object v0, p0, Lc/b/a/h;->t:Lc/b/a/a;

    invoke-virtual {v0}, Lc/b/a/a;->b()I

    move-result v0

    iput v0, p0, Lc/b/a/h;->u:I

    .line 9
    :cond_3b
    iget v0, p0, Lc/b/a/h;->v:I

    if-nez v0, :cond_47

    .line 10
    iget-object v0, p0, Lc/b/a/h;->t:Lc/b/a/a;

    invoke-virtual {v0}, Lc/b/a/a;->c()I

    move-result v0

    iput v0, p0, Lc/b/a/h;->v:I

    .line 11
    :cond_47
    invoke-virtual {p0}, Lc/b/a/h;->F()V

    :cond_4a
    return-void
.end method

.method public y()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Lc/b/a/h;->z:Z

    return v0
.end method

.method public z()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Lc/b/a/h;->q:Z

    return v0
.end method
