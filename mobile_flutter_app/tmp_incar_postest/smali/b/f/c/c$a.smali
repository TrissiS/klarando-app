.class public Lb/f/c/c$a;
.super Ljava/lang/Object;
.source "ConstraintSet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/f/c/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:I

.field public final b:Lb/f/c/c$d;

.field public final c:Lb/f/c/c$c;

.field public final d:Lb/f/c/c$b;

.field public final e:Lb/f/c/c$e;

.field public f:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lb/f/c/a;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Lb/f/c/c$d;

    invoke-direct {v0}, Lb/f/c/c$d;-><init>()V

    iput-object v0, p0, Lb/f/c/c$a;->b:Lb/f/c/c$d;

    .line 3
    new-instance v0, Lb/f/c/c$c;

    invoke-direct {v0}, Lb/f/c/c$c;-><init>()V

    iput-object v0, p0, Lb/f/c/c$a;->c:Lb/f/c/c$c;

    .line 4
    new-instance v0, Lb/f/c/c$b;

    invoke-direct {v0}, Lb/f/c/c$b;-><init>()V

    iput-object v0, p0, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    .line 5
    new-instance v0, Lb/f/c/c$e;

    invoke-direct {v0}, Lb/f/c/c$e;-><init>()V

    iput-object v0, p0, Lb/f/c/c$a;->e:Lb/f/c/c$e;

    .line 6
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lb/f/c/c$a;->f:Ljava/util/HashMap;

    return-void
.end method

.method public static synthetic a(Lb/f/c/c$a;ILandroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;)V
    .registers 3

    .line 1
    invoke-virtual {p0, p1, p2}, Lb/f/c/c$a;->a(ILandroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;)V

    return-void
.end method

.method public static synthetic a(Lb/f/c/c$a;ILandroidx/constraintlayout/widget/Constraints$LayoutParams;)V
    .registers 3

    .line 3
    invoke-virtual {p0, p1, p2}, Lb/f/c/c$a;->a(ILandroidx/constraintlayout/widget/Constraints$LayoutParams;)V

    return-void
.end method

.method public static synthetic a(Lb/f/c/c$a;Landroidx/constraintlayout/widget/ConstraintHelper;ILandroidx/constraintlayout/widget/Constraints$LayoutParams;)V
    .registers 4

    .line 2
    invoke-virtual {p0, p1, p2, p3}, Lb/f/c/c$a;->a(Landroidx/constraintlayout/widget/ConstraintHelper;ILandroidx/constraintlayout/widget/Constraints$LayoutParams;)V

    return-void
.end method


# virtual methods
.method public final a(ILandroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;)V
    .registers 5

    .line 25
    iput p1, p0, Lb/f/c/c$a;->a:I

    .line 26
    iget-object p1, p0, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->d:I

    iput v0, p1, Lb/f/c/c$b;->h:I

    .line 27
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->e:I

    iput v0, p1, Lb/f/c/c$b;->i:I

    .line 28
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->f:I

    iput v0, p1, Lb/f/c/c$b;->j:I

    .line 29
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->g:I

    iput v0, p1, Lb/f/c/c$b;->k:I

    .line 30
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->h:I

    iput v0, p1, Lb/f/c/c$b;->l:I

    .line 31
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->i:I

    iput v0, p1, Lb/f/c/c$b;->m:I

    .line 32
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->j:I

    iput v0, p1, Lb/f/c/c$b;->n:I

    .line 33
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->k:I

    iput v0, p1, Lb/f/c/c$b;->o:I

    .line 34
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->l:I

    iput v0, p1, Lb/f/c/c$b;->p:I

    .line 35
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->p:I

    iput v0, p1, Lb/f/c/c$b;->q:I

    .line 36
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->q:I

    iput v0, p1, Lb/f/c/c$b;->r:I

    .line 37
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->r:I

    iput v0, p1, Lb/f/c/c$b;->s:I

    .line 38
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->s:I

    iput v0, p1, Lb/f/c/c$b;->t:I

    .line 39
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->z:F

    iput v0, p1, Lb/f/c/c$b;->u:F

    .line 40
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->A:F

    iput v0, p1, Lb/f/c/c$b;->v:F

    .line 41
    iget-object v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->B:Ljava/lang/String;

    iput-object v0, p1, Lb/f/c/c$b;->w:Ljava/lang/String;

    .line 42
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->m:I

    iput v0, p1, Lb/f/c/c$b;->x:I

    .line 43
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->n:I

    iput v0, p1, Lb/f/c/c$b;->y:I

    .line 44
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->o:F

    iput v0, p1, Lb/f/c/c$b;->z:F

    .line 45
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->P:I

    iput v0, p1, Lb/f/c/c$b;->A:I

    .line 46
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->Q:I

    iput v0, p1, Lb/f/c/c$b;->B:I

    .line 47
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->R:I

    iput v0, p1, Lb/f/c/c$b;->C:I

    .line 48
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->c:F

    iput v0, p1, Lb/f/c/c$b;->g:F

    .line 49
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->a:I

    iput v0, p1, Lb/f/c/c$b;->e:I

    .line 50
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->b:I

    iput v0, p1, Lb/f/c/c$b;->f:I

    .line 51
    iget v0, p2, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    iput v0, p1, Lb/f/c/c$b;->c:I

    .line 52
    iget v0, p2, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    iput v0, p1, Lb/f/c/c$b;->d:I

    .line 53
    iget v0, p2, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    iput v0, p1, Lb/f/c/c$b;->D:I

    .line 54
    iget v0, p2, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    iput v0, p1, Lb/f/c/c$b;->E:I

    .line 55
    iget v0, p2, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iput v0, p1, Lb/f/c/c$b;->F:I

    .line 56
    iget v0, p2, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    iput v0, p1, Lb/f/c/c$b;->G:I

    .line 57
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->E:F

    iput v0, p1, Lb/f/c/c$b;->P:F

    .line 58
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->D:F

    iput v0, p1, Lb/f/c/c$b;->Q:F

    .line 59
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->G:I

    iput v0, p1, Lb/f/c/c$b;->S:I

    .line 60
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->F:I

    iput v0, p1, Lb/f/c/c$b;->R:I

    .line 61
    iget-boolean v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->S:Z

    iput-boolean v0, p1, Lb/f/c/c$b;->h0:Z

    .line 62
    iget-boolean v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->T:Z

    iput-boolean v0, p1, Lb/f/c/c$b;->i0:Z

    .line 63
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->H:I

    iput v0, p1, Lb/f/c/c$b;->T:I

    .line 64
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->I:I

    iput v0, p1, Lb/f/c/c$b;->U:I

    .line 65
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->L:I

    iput v0, p1, Lb/f/c/c$b;->V:I

    .line 66
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->M:I

    iput v0, p1, Lb/f/c/c$b;->W:I

    .line 67
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->J:I

    iput v0, p1, Lb/f/c/c$b;->X:I

    .line 68
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->K:I

    iput v0, p1, Lb/f/c/c$b;->Y:I

    .line 69
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->N:F

    iput v0, p1, Lb/f/c/c$b;->Z:F

    .line 70
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->O:F

    iput v0, p1, Lb/f/c/c$b;->a0:F

    .line 71
    iget-object v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->U:Ljava/lang/String;

    iput-object v0, p1, Lb/f/c/c$b;->g0:Ljava/lang/String;

    .line 72
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->u:I

    iput v0, p1, Lb/f/c/c$b;->K:I

    .line 73
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->w:I

    iput v0, p1, Lb/f/c/c$b;->M:I

    .line 74
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->t:I

    iput v0, p1, Lb/f/c/c$b;->J:I

    .line 75
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->v:I

    iput v0, p1, Lb/f/c/c$b;->L:I

    .line 76
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->x:I

    iput v0, p1, Lb/f/c/c$b;->O:I

    .line 77
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->y:I

    iput v0, p1, Lb/f/c/c$b;->N:I

    .line 78
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-lt v0, v1, :cond_e8

    .line 79
    invoke-virtual {p2}, Landroid/view/ViewGroup$MarginLayoutParams;->getMarginEnd()I

    move-result v0

    iput v0, p1, Lb/f/c/c$b;->H:I

    .line 80
    iget-object p1, p0, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    invoke-virtual {p2}, Landroid/view/ViewGroup$MarginLayoutParams;->getMarginStart()I

    move-result p2

    iput p2, p1, Lb/f/c/c$b;->I:I

    :cond_e8
    return-void
.end method

.method public final a(ILandroidx/constraintlayout/widget/Constraints$LayoutParams;)V
    .registers 4

    .line 11
    invoke-virtual {p0, p1, p2}, Lb/f/c/c$a;->a(ILandroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;)V

    .line 12
    iget-object p1, p0, Lb/f/c/c$a;->b:Lb/f/c/c$d;

    iget v0, p2, Landroidx/constraintlayout/widget/Constraints$LayoutParams;->o0:F

    iput v0, p1, Lb/f/c/c$d;->d:F

    .line 13
    iget-object p1, p0, Lb/f/c/c$a;->e:Lb/f/c/c$e;

    iget v0, p2, Landroidx/constraintlayout/widget/Constraints$LayoutParams;->r0:F

    iput v0, p1, Lb/f/c/c$e;->b:F

    .line 14
    iget v0, p2, Landroidx/constraintlayout/widget/Constraints$LayoutParams;->s0:F

    iput v0, p1, Lb/f/c/c$e;->c:F

    .line 15
    iget v0, p2, Landroidx/constraintlayout/widget/Constraints$LayoutParams;->t0:F

    iput v0, p1, Lb/f/c/c$e;->d:F

    .line 16
    iget v0, p2, Landroidx/constraintlayout/widget/Constraints$LayoutParams;->u0:F

    iput v0, p1, Lb/f/c/c$e;->e:F

    .line 17
    iget v0, p2, Landroidx/constraintlayout/widget/Constraints$LayoutParams;->v0:F

    iput v0, p1, Lb/f/c/c$e;->f:F

    .line 18
    iget v0, p2, Landroidx/constraintlayout/widget/Constraints$LayoutParams;->w0:F

    iput v0, p1, Lb/f/c/c$e;->g:F

    .line 19
    iget v0, p2, Landroidx/constraintlayout/widget/Constraints$LayoutParams;->x0:F

    iput v0, p1, Lb/f/c/c$e;->h:F

    .line 20
    iget v0, p2, Landroidx/constraintlayout/widget/Constraints$LayoutParams;->y0:F

    iput v0, p1, Lb/f/c/c$e;->i:F

    .line 21
    iget v0, p2, Landroidx/constraintlayout/widget/Constraints$LayoutParams;->z0:F

    iput v0, p1, Lb/f/c/c$e;->j:F

    .line 22
    iget v0, p2, Landroidx/constraintlayout/widget/Constraints$LayoutParams;->A0:F

    iput v0, p1, Lb/f/c/c$e;->k:F

    .line 23
    iget v0, p2, Landroidx/constraintlayout/widget/Constraints$LayoutParams;->q0:F

    iput v0, p1, Lb/f/c/c$e;->m:F

    .line 24
    iget-boolean p2, p2, Landroidx/constraintlayout/widget/Constraints$LayoutParams;->p0:Z

    iput-boolean p2, p1, Lb/f/c/c$e;->l:Z

    return-void
.end method

.method public final a(Landroidx/constraintlayout/widget/ConstraintHelper;ILandroidx/constraintlayout/widget/Constraints$LayoutParams;)V
    .registers 4

    .line 4
    invoke-virtual {p0, p2, p3}, Lb/f/c/c$a;->a(ILandroidx/constraintlayout/widget/Constraints$LayoutParams;)V

    .line 5
    instance-of p2, p1, Landroidx/constraintlayout/widget/Barrier;

    if-eqz p2, :cond_24

    .line 6
    iget-object p2, p0, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    const/4 p3, 0x1

    iput p3, p2, Lb/f/c/c$b;->d0:I

    .line 7
    check-cast p1, Landroidx/constraintlayout/widget/Barrier;

    .line 8
    invoke-virtual {p1}, Landroidx/constraintlayout/widget/Barrier;->getType()I

    move-result p3

    iput p3, p2, Lb/f/c/c$b;->b0:I

    .line 9
    iget-object p2, p0, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    invoke-virtual {p1}, Landroidx/constraintlayout/widget/ConstraintHelper;->getReferencedIds()[I

    move-result-object p3

    iput-object p3, p2, Lb/f/c/c$b;->e0:[I

    .line 10
    iget-object p2, p0, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    invoke-virtual {p1}, Landroidx/constraintlayout/widget/Barrier;->getMargin()I

    move-result p1

    iput p1, p2, Lb/f/c/c$b;->c0:I

    :cond_24
    return-void
.end method

.method public a(Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;)V
    .registers 4

    .line 81
    iget-object v0, p0, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v1, v0, Lb/f/c/c$b;->h:I

    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->d:I

    .line 82
    iget v1, v0, Lb/f/c/c$b;->i:I

    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->e:I

    .line 83
    iget v1, v0, Lb/f/c/c$b;->j:I

    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->f:I

    .line 84
    iget v1, v0, Lb/f/c/c$b;->k:I

    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->g:I

    .line 85
    iget v1, v0, Lb/f/c/c$b;->l:I

    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->h:I

    .line 86
    iget v1, v0, Lb/f/c/c$b;->m:I

    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->i:I

    .line 87
    iget v1, v0, Lb/f/c/c$b;->n:I

    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->j:I

    .line 88
    iget v1, v0, Lb/f/c/c$b;->o:I

    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->k:I

    .line 89
    iget v1, v0, Lb/f/c/c$b;->p:I

    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->l:I

    .line 90
    iget v1, v0, Lb/f/c/c$b;->q:I

    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->p:I

    .line 91
    iget v1, v0, Lb/f/c/c$b;->r:I

    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->q:I

    .line 92
    iget v1, v0, Lb/f/c/c$b;->s:I

    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->r:I

    .line 93
    iget v1, v0, Lb/f/c/c$b;->t:I

    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->s:I

    .line 94
    iget v1, v0, Lb/f/c/c$b;->D:I

    iput v1, p1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 95
    iget v1, v0, Lb/f/c/c$b;->E:I

    iput v1, p1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 96
    iget v1, v0, Lb/f/c/c$b;->F:I

    iput v1, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 97
    iget v1, v0, Lb/f/c/c$b;->G:I

    iput v1, p1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 98
    iget v1, v0, Lb/f/c/c$b;->O:I

    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->x:I

    .line 99
    iget v1, v0, Lb/f/c/c$b;->N:I

    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->y:I

    .line 100
    iget v1, v0, Lb/f/c/c$b;->K:I

    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->u:I

    .line 101
    iget v1, v0, Lb/f/c/c$b;->M:I

    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->w:I

    .line 102
    iget v1, v0, Lb/f/c/c$b;->u:F

    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->z:F

    .line 103
    iget v1, v0, Lb/f/c/c$b;->v:F

    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->A:F

    .line 104
    iget v1, v0, Lb/f/c/c$b;->x:I

    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->m:I

    .line 105
    iget v1, v0, Lb/f/c/c$b;->y:I

    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->n:I

    .line 106
    iget v1, v0, Lb/f/c/c$b;->z:F

    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->o:F

    .line 107
    iget-object v1, v0, Lb/f/c/c$b;->w:Ljava/lang/String;

    iput-object v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->B:Ljava/lang/String;

    .line 108
    iget v1, v0, Lb/f/c/c$b;->A:I

    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->P:I

    .line 109
    iget v1, v0, Lb/f/c/c$b;->B:I

    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->Q:I

    .line 110
    iget v1, v0, Lb/f/c/c$b;->P:F

    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->E:F

    .line 111
    iget v1, v0, Lb/f/c/c$b;->Q:F

    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->D:F

    .line 112
    iget v1, v0, Lb/f/c/c$b;->S:I

    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->G:I

    .line 113
    iget v1, v0, Lb/f/c/c$b;->R:I

    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->F:I

    .line 114
    iget-boolean v1, v0, Lb/f/c/c$b;->h0:Z

    iput-boolean v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->S:Z

    .line 115
    iget-boolean v1, v0, Lb/f/c/c$b;->i0:Z

    iput-boolean v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->T:Z

    .line 116
    iget v1, v0, Lb/f/c/c$b;->T:I

    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->H:I

    .line 117
    iget v1, v0, Lb/f/c/c$b;->U:I

    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->I:I

    .line 118
    iget v1, v0, Lb/f/c/c$b;->V:I

    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->L:I

    .line 119
    iget v1, v0, Lb/f/c/c$b;->W:I

    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->M:I

    .line 120
    iget v1, v0, Lb/f/c/c$b;->X:I

    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->J:I

    .line 121
    iget v1, v0, Lb/f/c/c$b;->Y:I

    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->K:I

    .line 122
    iget v1, v0, Lb/f/c/c$b;->Z:F

    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->N:F

    .line 123
    iget v1, v0, Lb/f/c/c$b;->a0:F

    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->O:F

    .line 124
    iget v1, v0, Lb/f/c/c$b;->C:I

    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->R:I

    .line 125
    iget v1, v0, Lb/f/c/c$b;->g:F

    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->c:F

    .line 126
    iget v1, v0, Lb/f/c/c$b;->e:I

    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->a:I

    .line 127
    iget v1, v0, Lb/f/c/c$b;->f:I

    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->b:I

    .line 128
    iget v1, v0, Lb/f/c/c$b;->c:I

    iput v1, p1, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 129
    iget v1, v0, Lb/f/c/c$b;->d:I

    iput v1, p1, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 130
    iget-object v0, v0, Lb/f/c/c$b;->g0:Ljava/lang/String;

    if-eqz v0, :cond_cc

    .line 131
    iput-object v0, p1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->U:Ljava/lang/String;

    .line 132
    :cond_cc
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-lt v0, v1, :cond_e0

    .line 133
    iget-object v0, p0, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v0, v0, Lb/f/c/c$b;->I:I

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    .line 134
    iget-object v0, p0, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v0, v0, Lb/f/c/c$b;->H:I

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginEnd(I)V

    .line 135
    :cond_e0
    invoke-virtual {p1}, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->c()V

    return-void
.end method

.method public clone()Lb/f/c/c$a;
    .registers 4

    .line 2
    new-instance v0, Lb/f/c/c$a;

    invoke-direct {v0}, Lb/f/c/c$a;-><init>()V

    .line 3
    iget-object v1, v0, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget-object v2, p0, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    invoke-virtual {v1, v2}, Lb/f/c/c$b;->a(Lb/f/c/c$b;)V

    .line 4
    iget-object v1, v0, Lb/f/c/c$a;->c:Lb/f/c/c$c;

    iget-object v2, p0, Lb/f/c/c$a;->c:Lb/f/c/c$c;

    invoke-virtual {v1, v2}, Lb/f/c/c$c;->a(Lb/f/c/c$c;)V

    .line 5
    iget-object v1, v0, Lb/f/c/c$a;->b:Lb/f/c/c$d;

    iget-object v2, p0, Lb/f/c/c$a;->b:Lb/f/c/c$d;

    invoke-virtual {v1, v2}, Lb/f/c/c$d;->a(Lb/f/c/c$d;)V

    .line 6
    iget-object v1, v0, Lb/f/c/c$a;->e:Lb/f/c/c$e;

    iget-object v2, p0, Lb/f/c/c$a;->e:Lb/f/c/c$e;

    invoke-virtual {v1, v2}, Lb/f/c/c$e;->a(Lb/f/c/c$e;)V

    .line 7
    iget v1, p0, Lb/f/c/c$a;->a:I

    iput v1, v0, Lb/f/c/c$a;->a:I

    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lb/f/c/c$a;->clone()Lb/f/c/c$a;

    move-result-object v0

    return-object v0
.end method
