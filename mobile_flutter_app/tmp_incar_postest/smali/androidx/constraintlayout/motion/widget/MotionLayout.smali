.class public Landroidx/constraintlayout/motion/widget/MotionLayout;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "MotionLayout.java"

# interfaces
.implements Lb/h/m/p;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/constraintlayout/motion/widget/MotionLayout$i;,
        Landroidx/constraintlayout/motion/widget/MotionLayout$d;,
        Landroidx/constraintlayout/motion/widget/MotionLayout$e;,
        Landroidx/constraintlayout/motion/widget/MotionLayout$c;,
        Landroidx/constraintlayout/motion/widget/MotionLayout$h;,
        Landroidx/constraintlayout/motion/widget/MotionLayout$g;,
        Landroidx/constraintlayout/motion/widget/MotionLayout$f;,
        Landroidx/constraintlayout/motion/widget/MotionLayout$j;
    }
.end annotation


# static fields
.field public static J0:Z


# instance fields
.field public A:F

.field public A0:Lb/f/a/b/e;

.field public B:I

.field public B0:Z

.field public C:I

.field public C0:Landroidx/constraintlayout/motion/widget/MotionLayout$h;

.field public D:I

.field public D0:Landroidx/constraintlayout/motion/widget/MotionLayout$j;

.field public E:I

.field public E0:Landroidx/constraintlayout/motion/widget/MotionLayout$e;

.field public F:I

.field public F0:Z

.field public G:Z

.field public G0:Landroid/graphics/RectF;

.field public H:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Landroid/view/View;",
            "Lb/f/a/b/n;",
            ">;"
        }
    .end annotation
.end field

.field public H0:Landroid/view/View;

.field public I:J

.field public I0:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public J:F

.field public K:F

.field public L:F

.field public M:J

.field public N:F

.field public O:Z

.field public P:Z

.field public Q:Landroidx/constraintlayout/motion/widget/MotionLayout$i;

.field public R:F

.field public S:F

.field public T:I

.field public U:Landroidx/constraintlayout/motion/widget/MotionLayout$d;

.field public V:Z

.field public W:Lb/f/a/a/g;

.field public a0:Landroidx/constraintlayout/motion/widget/MotionLayout$c;

.field public b0:Lb/f/a/b/b;

.field public c0:I

.field public d0:I

.field public e0:Z

.field public f0:F

.field public g0:F

.field public h0:J

.field public i0:F

.field public j0:Z

.field public k0:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/constraintlayout/motion/widget/MotionHelper;",
            ">;"
        }
    .end annotation
.end field

.field public l0:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/constraintlayout/motion/widget/MotionHelper;",
            ">;"
        }
    .end annotation
.end field

.field public m0:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/constraintlayout/motion/widget/MotionLayout$i;",
            ">;"
        }
    .end annotation
.end field

.field public n0:I

.field public o0:J

.field public p0:F

.field public q0:I

.field public r0:F

.field public s0:Z

.field public t0:I

.field public u0:I

.field public v0:I

.field public w0:I

.field public x0:I

.field public y:Lb/f/a/b/q;

.field public y0:I

.field public z:Landroid/view/animation/Interpolator;

.field public z0:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 6

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x0

    .line 2
    iput p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->A:F

    const/4 v0, -0x1

    .line 3
    iput v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->B:I

    .line 4
    iput v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C:I

    .line 5
    iput v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->D:I

    const/4 v0, 0x0

    .line 6
    iput v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->E:I

    .line 7
    iput v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->F:I

    const/4 v1, 0x1

    .line 8
    iput-boolean v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->G:Z

    .line 9
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->H:Ljava/util/HashMap;

    const-wide/16 v1, 0x0

    .line 10
    iput-wide v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->I:J

    const/high16 v1, 0x3f800000    # 1.0f

    .line 11
    iput v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->J:F

    .line 12
    iput p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->K:F

    .line 13
    iput p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->L:F

    .line 14
    iput p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->N:F

    .line 15
    iput-boolean v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->P:Z

    .line 16
    iput v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->T:I

    .line 17
    iput-boolean v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->V:Z

    .line 18
    new-instance v1, Lb/f/a/a/g;

    invoke-direct {v1}, Lb/f/a/a/g;-><init>()V

    iput-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->W:Lb/f/a/a/g;

    .line 19
    new-instance v1, Landroidx/constraintlayout/motion/widget/MotionLayout$c;

    invoke-direct {v1, p0}, Landroidx/constraintlayout/motion/widget/MotionLayout$c;-><init>(Landroidx/constraintlayout/motion/widget/MotionLayout;)V

    iput-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->a0:Landroidx/constraintlayout/motion/widget/MotionLayout$c;

    .line 20
    iput-boolean v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->e0:Z

    .line 21
    iput-boolean v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->j0:Z

    const/4 v1, 0x0

    .line 22
    iput-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->k0:Ljava/util/ArrayList;

    .line 23
    iput-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->l0:Ljava/util/ArrayList;

    .line 24
    iput-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->m0:Ljava/util/ArrayList;

    .line 25
    iput v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->n0:I

    const-wide/16 v2, -0x1

    .line 26
    iput-wide v2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->o0:J

    .line 27
    iput p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->p0:F

    .line 28
    iput v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->q0:I

    .line 29
    iput p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->r0:F

    .line 30
    iput-boolean v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->s0:Z

    .line 31
    new-instance p1, Lb/f/a/b/e;

    invoke-direct {p1}, Lb/f/a/b/e;-><init>()V

    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->A0:Lb/f/a/b/e;

    .line 32
    iput-boolean v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->B0:Z

    .line 33
    sget-object p1, Landroidx/constraintlayout/motion/widget/MotionLayout$j;->UNDEFINED:Landroidx/constraintlayout/motion/widget/MotionLayout$j;

    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->D0:Landroidx/constraintlayout/motion/widget/MotionLayout$j;

    .line 34
    new-instance p1, Landroidx/constraintlayout/motion/widget/MotionLayout$e;

    invoke-direct {p1, p0}, Landroidx/constraintlayout/motion/widget/MotionLayout$e;-><init>(Landroidx/constraintlayout/motion/widget/MotionLayout;)V

    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->E0:Landroidx/constraintlayout/motion/widget/MotionLayout$e;

    .line 35
    iput-boolean v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->F0:Z

    .line 36
    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->G0:Landroid/graphics/RectF;

    .line 37
    iput-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->H0:Landroid/view/View;

    .line 38
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->I0:Ljava/util/ArrayList;

    .line 39
    invoke-virtual {p0, v1}, Landroidx/constraintlayout/motion/widget/MotionLayout;->a(Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 7

    .line 40
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 41
    iput p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->A:F

    const/4 v0, -0x1

    .line 42
    iput v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->B:I

    .line 43
    iput v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C:I

    .line 44
    iput v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->D:I

    const/4 v0, 0x0

    .line 45
    iput v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->E:I

    .line 46
    iput v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->F:I

    const/4 v1, 0x1

    .line 47
    iput-boolean v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->G:Z

    .line 48
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->H:Ljava/util/HashMap;

    const-wide/16 v1, 0x0

    .line 49
    iput-wide v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->I:J

    const/high16 v1, 0x3f800000    # 1.0f

    .line 50
    iput v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->J:F

    .line 51
    iput p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->K:F

    .line 52
    iput p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->L:F

    .line 53
    iput p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->N:F

    .line 54
    iput-boolean v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->P:Z

    .line 55
    iput v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->T:I

    .line 56
    iput-boolean v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->V:Z

    .line 57
    new-instance v1, Lb/f/a/a/g;

    invoke-direct {v1}, Lb/f/a/a/g;-><init>()V

    iput-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->W:Lb/f/a/a/g;

    .line 58
    new-instance v1, Landroidx/constraintlayout/motion/widget/MotionLayout$c;

    invoke-direct {v1, p0}, Landroidx/constraintlayout/motion/widget/MotionLayout$c;-><init>(Landroidx/constraintlayout/motion/widget/MotionLayout;)V

    iput-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->a0:Landroidx/constraintlayout/motion/widget/MotionLayout$c;

    .line 59
    iput-boolean v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->e0:Z

    .line 60
    iput-boolean v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->j0:Z

    const/4 v1, 0x0

    .line 61
    iput-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->k0:Ljava/util/ArrayList;

    .line 62
    iput-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->l0:Ljava/util/ArrayList;

    .line 63
    iput-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->m0:Ljava/util/ArrayList;

    .line 64
    iput v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->n0:I

    const-wide/16 v2, -0x1

    .line 65
    iput-wide v2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->o0:J

    .line 66
    iput p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->p0:F

    .line 67
    iput v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->q0:I

    .line 68
    iput p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->r0:F

    .line 69
    iput-boolean v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->s0:Z

    .line 70
    new-instance p1, Lb/f/a/b/e;

    invoke-direct {p1}, Lb/f/a/b/e;-><init>()V

    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->A0:Lb/f/a/b/e;

    .line 71
    iput-boolean v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->B0:Z

    .line 72
    sget-object p1, Landroidx/constraintlayout/motion/widget/MotionLayout$j;->UNDEFINED:Landroidx/constraintlayout/motion/widget/MotionLayout$j;

    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->D0:Landroidx/constraintlayout/motion/widget/MotionLayout$j;

    .line 73
    new-instance p1, Landroidx/constraintlayout/motion/widget/MotionLayout$e;

    invoke-direct {p1, p0}, Landroidx/constraintlayout/motion/widget/MotionLayout$e;-><init>(Landroidx/constraintlayout/motion/widget/MotionLayout;)V

    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->E0:Landroidx/constraintlayout/motion/widget/MotionLayout$e;

    .line 74
    iput-boolean v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->F0:Z

    .line 75
    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->G0:Landroid/graphics/RectF;

    .line 76
    iput-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->H0:Landroid/view/View;

    .line 77
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->I0:Ljava/util/ArrayList;

    .line 78
    invoke-virtual {p0, p2}, Landroidx/constraintlayout/motion/widget/MotionLayout;->a(Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 7

    .line 79
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 80
    iput p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->A:F

    const/4 p3, -0x1

    .line 81
    iput p3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->B:I

    .line 82
    iput p3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C:I

    .line 83
    iput p3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->D:I

    const/4 p3, 0x0

    .line 84
    iput p3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->E:I

    .line 85
    iput p3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->F:I

    const/4 v0, 0x1

    .line 86
    iput-boolean v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->G:Z

    .line 87
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->H:Ljava/util/HashMap;

    const-wide/16 v0, 0x0

    .line 88
    iput-wide v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->I:J

    const/high16 v0, 0x3f800000    # 1.0f

    .line 89
    iput v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->J:F

    .line 90
    iput p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->K:F

    .line 91
    iput p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->L:F

    .line 92
    iput p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->N:F

    .line 93
    iput-boolean p3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->P:Z

    .line 94
    iput p3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->T:I

    .line 95
    iput-boolean p3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->V:Z

    .line 96
    new-instance v0, Lb/f/a/a/g;

    invoke-direct {v0}, Lb/f/a/a/g;-><init>()V

    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->W:Lb/f/a/a/g;

    .line 97
    new-instance v0, Landroidx/constraintlayout/motion/widget/MotionLayout$c;

    invoke-direct {v0, p0}, Landroidx/constraintlayout/motion/widget/MotionLayout$c;-><init>(Landroidx/constraintlayout/motion/widget/MotionLayout;)V

    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->a0:Landroidx/constraintlayout/motion/widget/MotionLayout$c;

    .line 98
    iput-boolean p3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->e0:Z

    .line 99
    iput-boolean p3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->j0:Z

    const/4 v0, 0x0

    .line 100
    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->k0:Ljava/util/ArrayList;

    .line 101
    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->l0:Ljava/util/ArrayList;

    .line 102
    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->m0:Ljava/util/ArrayList;

    .line 103
    iput p3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->n0:I

    const-wide/16 v1, -0x1

    .line 104
    iput-wide v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->o0:J

    .line 105
    iput p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->p0:F

    .line 106
    iput p3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->q0:I

    .line 107
    iput p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->r0:F

    .line 108
    iput-boolean p3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->s0:Z

    .line 109
    new-instance p1, Lb/f/a/b/e;

    invoke-direct {p1}, Lb/f/a/b/e;-><init>()V

    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->A0:Lb/f/a/b/e;

    .line 110
    iput-boolean p3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->B0:Z

    .line 111
    sget-object p1, Landroidx/constraintlayout/motion/widget/MotionLayout$j;->UNDEFINED:Landroidx/constraintlayout/motion/widget/MotionLayout$j;

    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->D0:Landroidx/constraintlayout/motion/widget/MotionLayout$j;

    .line 112
    new-instance p1, Landroidx/constraintlayout/motion/widget/MotionLayout$e;

    invoke-direct {p1, p0}, Landroidx/constraintlayout/motion/widget/MotionLayout$e;-><init>(Landroidx/constraintlayout/motion/widget/MotionLayout;)V

    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->E0:Landroidx/constraintlayout/motion/widget/MotionLayout$e;

    .line 113
    iput-boolean p3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->F0:Z

    .line 114
    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->G0:Landroid/graphics/RectF;

    .line 115
    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->H0:Landroid/view/View;

    .line 116
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->I0:Ljava/util/ArrayList;

    .line 117
    invoke-virtual {p0, p2}, Landroidx/constraintlayout/motion/widget/MotionLayout;->a(Landroid/util/AttributeSet;)V

    return-void
.end method

.method public static synthetic a(Landroidx/constraintlayout/motion/widget/MotionLayout;)I
    .registers 1

    .line 1
    iget p0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->D:I

    return p0
.end method

.method public static synthetic a(Landroidx/constraintlayout/motion/widget/MotionLayout;IIIIZZ)V
    .registers 7

    .line 3
    invoke-virtual/range {p0 .. p6}, Landroidx/constraintlayout/widget/ConstraintLayout;->a(IIIIZZ)V

    return-void
.end method

.method public static synthetic a(Landroidx/constraintlayout/motion/widget/MotionLayout;Lb/f/b/k/f;III)V
    .registers 5

    .line 2
    invoke-virtual {p0, p1, p2, p3, p4}, Landroidx/constraintlayout/widget/ConstraintLayout;->a(Lb/f/b/k/f;III)V

    return-void
.end method

.method public static synthetic a(Landroidx/constraintlayout/motion/widget/MotionLayout;ZLandroid/view/View;Lb/f/b/k/e;Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;Landroid/util/SparseArray;)V
    .registers 6

    .line 4
    invoke-virtual/range {p0 .. p5}, Landroidx/constraintlayout/widget/ConstraintLayout;->a(ZLandroid/view/View;Lb/f/b/k/e;Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;Landroid/util/SparseArray;)V

    return-void
.end method

.method public static a(FFF)Z
    .registers 8

    const/4 v0, 0x1

    const/4 v1, 0x0

    const/high16 v2, 0x40000000    # 2.0f

    const/4 v3, 0x0

    cmpl-float v4, p0, v3

    if-lez v4, :cond_1d

    div-float v3, p0, p2

    mul-float p0, p0, v3

    mul-float p2, p2, v3

    mul-float p2, p2, v3

    div-float/2addr p2, v2

    sub-float/2addr p0, p2

    add-float/2addr p1, p0

    const/high16 p0, 0x3f800000    # 1.0f

    cmpl-float p0, p1, p0

    if-lez p0, :cond_1b

    goto :goto_1c

    :cond_1b
    const/4 v0, 0x0

    :goto_1c
    return v0

    :cond_1d
    neg-float v4, p0

    div-float/2addr v4, p2

    mul-float p0, p0, v4

    mul-float p2, p2, v4

    mul-float p2, p2, v4

    div-float/2addr p2, v2

    add-float/2addr p0, p2

    add-float/2addr p1, p0

    cmpg-float p0, p1, v3

    if-gez p0, :cond_2d

    goto :goto_2e

    :cond_2d
    const/4 v0, 0x0

    :goto_2e
    return v0
.end method

.method public static synthetic b(Landroidx/constraintlayout/motion/widget/MotionLayout;)I
    .registers 1

    .line 1
    iget p0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->B:I

    return p0
.end method

.method public static synthetic b(Landroidx/constraintlayout/motion/widget/MotionLayout;Lb/f/b/k/f;III)V
    .registers 5

    .line 2
    invoke-virtual {p0, p1, p2, p3, p4}, Landroidx/constraintlayout/widget/ConstraintLayout;->a(Lb/f/b/k/f;III)V

    return-void
.end method

.method public static synthetic c(Landroidx/constraintlayout/motion/widget/MotionLayout;)I
    .registers 1

    .line 1
    iget p0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->F:I

    return p0
.end method

.method public static synthetic c(Landroidx/constraintlayout/motion/widget/MotionLayout;Lb/f/b/k/f;III)V
    .registers 5

    .line 2
    invoke-virtual {p0, p1, p2, p3, p4}, Landroidx/constraintlayout/widget/ConstraintLayout;->a(Lb/f/b/k/f;III)V

    return-void
.end method

.method public static synthetic d(Landroidx/constraintlayout/motion/widget/MotionLayout;)V
    .registers 1

    .line 1
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->o()V

    return-void
.end method

.method public static synthetic d(Landroidx/constraintlayout/motion/widget/MotionLayout;Lb/f/b/k/f;III)V
    .registers 5

    .line 2
    invoke-virtual {p0, p1, p2, p3, p4}, Landroidx/constraintlayout/widget/ConstraintLayout;->a(Lb/f/b/k/f;III)V

    return-void
.end method

.method public static synthetic e(Landroidx/constraintlayout/motion/widget/MotionLayout;)Lb/f/b/k/f;
    .registers 1

    .line 2
    iget-object p0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->j:Lb/f/b/k/f;

    return-object p0
.end method

.method public static synthetic e(Landroidx/constraintlayout/motion/widget/MotionLayout;Lb/f/b/k/f;III)V
    .registers 5

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Landroidx/constraintlayout/widget/ConstraintLayout;->a(Lb/f/b/k/f;III)V

    return-void
.end method

.method public static synthetic f(Landroidx/constraintlayout/motion/widget/MotionLayout;)Lb/f/b/k/f;
    .registers 1

    .line 2
    iget-object p0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->j:Lb/f/b/k/f;

    return-object p0
.end method

.method public static synthetic f(Landroidx/constraintlayout/motion/widget/MotionLayout;Lb/f/b/k/f;III)V
    .registers 5

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Landroidx/constraintlayout/widget/ConstraintLayout;->a(Lb/f/b/k/f;III)V

    return-void
.end method

.method public static synthetic g(Landroidx/constraintlayout/motion/widget/MotionLayout;)Lb/f/b/k/f;
    .registers 1

    .line 2
    iget-object p0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->j:Lb/f/b/k/f;

    return-object p0
.end method

.method public static synthetic g(Landroidx/constraintlayout/motion/widget/MotionLayout;Lb/f/b/k/f;III)V
    .registers 5

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Landroidx/constraintlayout/widget/ConstraintLayout;->a(Lb/f/b/k/f;III)V

    return-void
.end method

.method public static synthetic h(Landroidx/constraintlayout/motion/widget/MotionLayout;)Lb/f/b/k/f;
    .registers 1

    .line 2
    iget-object p0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->j:Lb/f/b/k/f;

    return-object p0
.end method

.method public static synthetic h(Landroidx/constraintlayout/motion/widget/MotionLayout;Lb/f/b/k/f;III)V
    .registers 5

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Landroidx/constraintlayout/widget/ConstraintLayout;->a(Lb/f/b/k/f;III)V

    return-void
.end method

.method public static synthetic i(Landroidx/constraintlayout/motion/widget/MotionLayout;)Z
    .registers 1

    .line 1
    invoke-virtual {p0}, Landroidx/constraintlayout/widget/ConstraintLayout;->a()Z

    move-result p0

    return p0
.end method

.method public static synthetic j(Landroidx/constraintlayout/motion/widget/MotionLayout;)Z
    .registers 1

    .line 1
    invoke-virtual {p0}, Landroidx/constraintlayout/widget/ConstraintLayout;->a()Z

    move-result p0

    return p0
.end method

.method public static synthetic k(Landroidx/constraintlayout/motion/widget/MotionLayout;)I
    .registers 1

    .line 1
    iget p0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->E:I

    return p0
.end method


# virtual methods
.method public a(F)V
    .registers 5

    .line 65
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    if-nez v0, :cond_5

    return-void

    .line 66
    :cond_5
    iget v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->L:F

    iget v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->K:F

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_13

    iget-boolean v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->O:Z

    if-eqz v0, :cond_13

    .line 67
    iput v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->L:F

    .line 68
    :cond_13
    iget v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->L:F

    cmpl-float v1, v0, p1

    if-nez v1, :cond_1a

    return-void

    :cond_1a
    const/4 v1, 0x0

    .line 69
    iput-boolean v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->V:Z

    .line 70
    iput p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->N:F

    .line 71
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    invoke-virtual {p1}, Lb/f/a/b/q;->d()I

    move-result p1

    int-to-float p1, p1

    const/high16 v2, 0x447a0000    # 1000.0f

    div-float/2addr p1, v2

    iput p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->J:F

    .line 72
    iget p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->N:F

    invoke-virtual {p0, p1}, Landroidx/constraintlayout/motion/widget/MotionLayout;->setProgress(F)V

    .line 73
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    invoke-virtual {p1}, Lb/f/a/b/q;->f()Landroid/view/animation/Interpolator;

    move-result-object p1

    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->z:Landroid/view/animation/Interpolator;

    .line 74
    iput-boolean v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->O:Z

    .line 75
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->getNanoTime()J

    move-result-wide v1

    iput-wide v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->I:J

    const/4 p1, 0x1

    .line 76
    iput-boolean p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->P:Z

    .line 77
    iput v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->K:F

    .line 78
    iput v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->L:F

    .line 79
    invoke-virtual {p0}, Landroid/view/ViewGroup;->invalidate()V

    return-void
.end method

.method public a(FF)V
    .registers 4

    .line 26
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->isAttachedToWindow()Z

    move-result v0

    if-nez v0, :cond_1c

    .line 27
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C0:Landroidx/constraintlayout/motion/widget/MotionLayout$h;

    if-nez v0, :cond_11

    .line 28
    new-instance v0, Landroidx/constraintlayout/motion/widget/MotionLayout$h;

    invoke-direct {v0, p0}, Landroidx/constraintlayout/motion/widget/MotionLayout$h;-><init>(Landroidx/constraintlayout/motion/widget/MotionLayout;)V

    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C0:Landroidx/constraintlayout/motion/widget/MotionLayout$h;

    .line 29
    :cond_11
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C0:Landroidx/constraintlayout/motion/widget/MotionLayout$h;

    invoke-virtual {v0, p1}, Landroidx/constraintlayout/motion/widget/MotionLayout$h;->a(F)V

    .line 30
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C0:Landroidx/constraintlayout/motion/widget/MotionLayout$h;

    invoke-virtual {p1, p2}, Landroidx/constraintlayout/motion/widget/MotionLayout$h;->b(F)V

    return-void

    .line 31
    :cond_1c
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/motion/widget/MotionLayout;->setProgress(F)V

    .line 32
    sget-object p1, Landroidx/constraintlayout/motion/widget/MotionLayout$j;->MOVING:Landroidx/constraintlayout/motion/widget/MotionLayout$j;

    invoke-virtual {p0, p1}, Landroidx/constraintlayout/motion/widget/MotionLayout;->setState(Landroidx/constraintlayout/motion/widget/MotionLayout$j;)V

    .line 33
    iput p2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->A:F

    const/high16 p1, 0x3f800000    # 1.0f

    .line 34
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/motion/widget/MotionLayout;->a(F)V

    return-void
.end method

.method public a(IFF)V
    .registers 13

    .line 35
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    if-nez v0, :cond_5

    return-void

    .line 36
    :cond_5
    iget v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->L:F

    cmpl-float v0, v0, p2

    if-nez v0, :cond_c

    return-void

    :cond_c
    const/4 v0, 0x1

    .line 37
    iput-boolean v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->V:Z

    .line 38
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->getNanoTime()J

    move-result-wide v1

    iput-wide v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->I:J

    .line 39
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    invoke-virtual {v1}, Lb/f/a/b/q;->d()I

    move-result v1

    int-to-float v1, v1

    const/high16 v2, 0x447a0000    # 1000.0f

    div-float/2addr v1, v2

    iput v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->J:F

    .line 40
    iput p2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->N:F

    .line 41
    iput-boolean v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->P:Z

    const/4 v1, 0x0

    const/4 v2, 0x2

    if-eqz p1, :cond_8b

    if-eq p1, v0, :cond_8b

    if-eq p1, v2, :cond_8b

    const/4 v0, 0x4

    if-eq p1, v0, :cond_79

    const/4 v0, 0x5

    if-eq p1, v0, :cond_35

    goto/16 :goto_b4

    .line 42
    :cond_35
    iget p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->L:F

    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    invoke-virtual {v0}, Lb/f/a/b/q;->g()F

    move-result v0

    invoke-static {p3, p1, v0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->a(FFF)Z

    move-result p1

    if-eqz p1, :cond_55

    .line 43
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->a0:Landroidx/constraintlayout/motion/widget/MotionLayout$c;

    iget p2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->L:F

    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    invoke-virtual {v0}, Lb/f/a/b/q;->g()F

    move-result v0

    invoke-virtual {p1, p3, p2, v0}, Landroidx/constraintlayout/motion/widget/MotionLayout$c;->a(FFF)V

    .line 44
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->a0:Landroidx/constraintlayout/motion/widget/MotionLayout$c;

    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->z:Landroid/view/animation/Interpolator;

    goto :goto_b4

    .line 45
    :cond_55
    iget-object v2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->W:Lb/f/a/a/g;

    iget v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->L:F

    iget v6, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->J:F

    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    .line 46
    invoke-virtual {p1}, Lb/f/a/b/q;->g()F

    move-result v7

    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    invoke-virtual {p1}, Lb/f/a/b/q;->h()F

    move-result v8

    move v4, p2

    move v5, p3

    .line 47
    invoke-virtual/range {v2 .. v8}, Lb/f/a/a/g;->a(FFFFFF)V

    .line 48
    iput v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->A:F

    .line 49
    iget p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C:I

    .line 50
    iput p2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->N:F

    .line 51
    iput p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C:I

    .line 52
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->W:Lb/f/a/a/g;

    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->z:Landroid/view/animation/Interpolator;

    goto :goto_b4

    .line 53
    :cond_79
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->a0:Landroidx/constraintlayout/motion/widget/MotionLayout$c;

    iget p2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->L:F

    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    invoke-virtual {v0}, Lb/f/a/b/q;->g()F

    move-result v0

    invoke-virtual {p1, p3, p2, v0}, Landroidx/constraintlayout/motion/widget/MotionLayout$c;->a(FFF)V

    .line 54
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->a0:Landroidx/constraintlayout/motion/widget/MotionLayout$c;

    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->z:Landroid/view/animation/Interpolator;

    goto :goto_b4

    :cond_8b
    if-ne p1, v0, :cond_8f

    const/4 p2, 0x0

    goto :goto_93

    :cond_8f
    if-ne p1, v2, :cond_93

    const/high16 p2, 0x3f800000    # 1.0f

    .line 55
    :cond_93
    :goto_93
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->W:Lb/f/a/a/g;

    iget v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->L:F

    iget v4, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->J:F

    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    .line 56
    invoke-virtual {p1}, Lb/f/a/b/q;->g()F

    move-result v5

    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    invoke-virtual {p1}, Lb/f/a/b/q;->h()F

    move-result v6

    move v2, p2

    move v3, p3

    .line 57
    invoke-virtual/range {v0 .. v6}, Lb/f/a/a/g;->a(FFFFFF)V

    .line 58
    iget p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C:I

    .line 59
    iput p2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->N:F

    .line 60
    iput p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C:I

    .line 61
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->W:Lb/f/a/a/g;

    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->z:Landroid/view/animation/Interpolator;

    :goto_b4
    const/4 p1, 0x0

    .line 62
    iput-boolean p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->O:Z

    .line 63
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->getNanoTime()J

    move-result-wide p1

    iput-wide p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->I:J

    .line 64
    invoke-virtual {p0}, Landroid/view/ViewGroup;->invalidate()V

    return-void
.end method

.method public a(IFFF[F)V
    .registers 8

    .line 276
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->H:Ljava/util/HashMap;

    invoke-virtual {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;->b(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/f/a/b/n;

    if-eqz v0, :cond_21

    .line 277
    invoke-virtual {v0, p2, p3, p4, p5}, Lb/f/a/b/n;->a(FFF[F)V

    .line 278
    invoke-virtual {v1}, Landroid/view/View;->getY()F

    move-result p1

    .line 279
    iget p3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->R:F

    sub-float p3, p2, p3

    const/4 p4, 0x0

    cmpl-float p3, p3, p4

    .line 280
    iput p2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->R:F

    .line 281
    iput p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->S:F

    goto :goto_57

    :cond_21
    if-nez v1, :cond_35

    .line 282
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, ""

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_41

    .line 283
    :cond_35
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p2, p1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p1

    .line 284
    :goto_41
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "WARNING could not find view id "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "MotionLayout"

    invoke-static {p2, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_57
    return-void
.end method

.method public a(II)V
    .registers 6

    .line 5
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->isAttachedToWindow()Z

    move-result v0

    if-nez v0, :cond_1c

    .line 6
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C0:Landroidx/constraintlayout/motion/widget/MotionLayout$h;

    if-nez v0, :cond_11

    .line 7
    new-instance v0, Landroidx/constraintlayout/motion/widget/MotionLayout$h;

    invoke-direct {v0, p0}, Landroidx/constraintlayout/motion/widget/MotionLayout$h;-><init>(Landroidx/constraintlayout/motion/widget/MotionLayout;)V

    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C0:Landroidx/constraintlayout/motion/widget/MotionLayout$h;

    .line 8
    :cond_11
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C0:Landroidx/constraintlayout/motion/widget/MotionLayout$h;

    invoke-virtual {v0, p1}, Landroidx/constraintlayout/motion/widget/MotionLayout$h;->b(I)V

    .line 9
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C0:Landroidx/constraintlayout/motion/widget/MotionLayout$h;

    invoke-virtual {p1, p2}, Landroidx/constraintlayout/motion/widget/MotionLayout$h;->a(I)V

    return-void

    .line 10
    :cond_1c
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    if-eqz v0, :cond_43

    .line 11
    iput p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->B:I

    .line 12
    iput p2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->D:I

    .line 13
    invoke-virtual {v0, p1, p2}, Lb/f/a/b/q;->a(II)V

    .line 14
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->E0:Landroidx/constraintlayout/motion/widget/MotionLayout$e;

    iget-object v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->j:Lb/f/b/k/f;

    iget-object v2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    invoke-virtual {v2, p1}, Lb/f/a/b/q;->a(I)Lb/f/c/c;

    move-result-object p1

    iget-object v2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    invoke-virtual {v2, p2}, Lb/f/a/b/q;->a(I)Lb/f/c/c;

    move-result-object p2

    invoke-virtual {v0, v1, p1, p2}, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->a(Lb/f/b/k/f;Lb/f/c/c;Lb/f/c/c;)V

    .line 15
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->n()V

    const/4 p1, 0x0

    .line 16
    iput p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->L:F

    .line 17
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->q()V

    :cond_43
    return-void
.end method

.method public a(III)V
    .registers 5

    .line 18
    sget-object v0, Landroidx/constraintlayout/motion/widget/MotionLayout$j;->SETUP:Landroidx/constraintlayout/motion/widget/MotionLayout$j;

    invoke-virtual {p0, v0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->setState(Landroidx/constraintlayout/motion/widget/MotionLayout$j;)V

    .line 19
    iput p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C:I

    const/4 v0, -0x1

    .line 20
    iput v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->B:I

    .line 21
    iput v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->D:I

    .line 22
    iget-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->r:Lb/f/c/b;

    if-eqz v0, :cond_16

    int-to-float p2, p2

    int-to-float p3, p3

    .line 23
    invoke-virtual {v0, p1, p2, p3}, Lb/f/c/b;->a(IFF)V

    goto :goto_21

    .line 24
    :cond_16
    iget-object p2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    if-eqz p2, :cond_21

    .line 25
    invoke-virtual {p2, p1}, Lb/f/a/b/q;->a(I)Lb/f/c/c;

    move-result-object p1

    invoke-virtual {p1, p0}, Lb/f/c/c;->b(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    :cond_21
    :goto_21
    return-void
.end method

.method public final a(ILb/f/c/c;)V
    .registers 13

    .line 243
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lb/f/a/b/a;->a(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object p1

    .line 244
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_e
    const/4 v3, -0x1

    const-string v4, "CHECK: "

    const-string v5, "MotionLayout"

    if-ge v2, v0, :cond_6d

    .line 245
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    .line 246
    invoke-virtual {v6}, Landroid/view/View;->getId()I

    move-result v7

    if-ne v7, v3, :cond_46

    .line 247
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, " ALL VIEWS SHOULD HAVE ID\'s "

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 248
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, " does not!"

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 249
    invoke-static {v5, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 250
    :cond_46
    invoke-virtual {p2, v7}, Lb/f/c/c;->b(I)Lb/f/c/c$a;

    move-result-object v3

    if-nez v3, :cond_6a

    .line 251
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " NO CONSTRAINTS for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v6}, Lb/f/a/b/a;->a(Landroid/view/View;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v5, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_6a
    add-int/lit8 v2, v2, 0x1

    goto :goto_e

    .line 252
    :cond_6d
    invoke-virtual {p2}, Lb/f/c/c;->a()[I

    move-result-object v0

    .line 253
    :goto_71
    array-length v2, v0

    if-ge v1, v2, :cond_e9

    .line 254
    aget v2, v0, v1

    .line 255
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6, v2}, Lb/f/a/b/a;->a(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v6

    .line 256
    aget v7, v0, v1

    invoke-virtual {p0, v7}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v7

    if-nez v7, :cond_a0

    .line 257
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, " NO View matches id "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 258
    :cond_a0
    invoke-virtual {p2, v2}, Lb/f/c/c;->c(I)I

    move-result v7

    const-string v8, ") no LAYOUT_HEIGHT"

    const-string v9, "("

    if-ne v7, v3, :cond_c5

    .line 259
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 260
    :cond_c5
    invoke-virtual {p2, v2}, Lb/f/c/c;->g(I)I

    move-result v2

    if-ne v2, v3, :cond_e6

    .line 261
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v5, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_e6
    add-int/lit8 v1, v1, 0x1

    goto :goto_71

    :cond_e9
    return-void
.end method

.method public a(IZF)V
    .registers 6

    .line 285
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->Q:Landroidx/constraintlayout/motion/widget/MotionLayout$i;

    if-eqz v0, :cond_7

    .line 286
    invoke-interface {v0, p0, p1, p2, p3}, Landroidx/constraintlayout/motion/widget/MotionLayout$i;->a(Landroidx/constraintlayout/motion/widget/MotionLayout;IZF)V

    .line 287
    :cond_7
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->m0:Ljava/util/ArrayList;

    if-eqz v0, :cond_1f

    .line 288
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/constraintlayout/motion/widget/MotionLayout$i;

    .line 289
    invoke-interface {v1, p0, p1, p2, p3}, Landroidx/constraintlayout/motion/widget/MotionLayout$i;->a(Landroidx/constraintlayout/motion/widget/MotionLayout;IZF)V

    goto :goto_f

    :cond_1f
    return-void
.end method

.method public final a(Landroid/util/AttributeSet;)V
    .registers 11

    .line 213
    invoke-virtual {p0}, Landroid/view/ViewGroup;->isInEditMode()Z

    move-result v0

    sput-boolean v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->J0:Z

    const/4 v0, -0x1

    if-eqz p1, :cond_8b

    .line 214
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    sget-object v2, Lb/f/c/f;->MotionLayout:[I

    .line 215
    invoke-virtual {v1, p1, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 216
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->getIndexCount()I

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x1

    :goto_1b
    if-ge v4, v1, :cond_78

    .line 217
    invoke-virtual {p1, v4}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v6

    .line 218
    sget v7, Lb/f/c/f;->MotionLayout_layoutDescription:I

    if-ne v6, v7, :cond_35

    .line 219
    invoke-virtual {p1, v6, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v6

    .line 220
    new-instance v7, Lb/f/a/b/q;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-direct {v7, v8, p0, v6}, Lb/f/a/b/q;-><init>(Landroid/content/Context;Landroidx/constraintlayout/motion/widget/MotionLayout;I)V

    iput-object v7, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    goto :goto_75

    .line 221
    :cond_35
    sget v7, Lb/f/c/f;->MotionLayout_currentState:I

    if-ne v6, v7, :cond_40

    .line 222
    invoke-virtual {p1, v6, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v6

    iput v6, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C:I

    goto :goto_75

    .line 223
    :cond_40
    sget v7, Lb/f/c/f;->MotionLayout_motionProgress:I

    if-ne v6, v7, :cond_4e

    const/4 v7, 0x0

    .line 224
    invoke-virtual {p1, v6, v7}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v6

    iput v6, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->N:F

    .line 225
    iput-boolean v2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->P:Z

    goto :goto_75

    .line 226
    :cond_4e
    sget v7, Lb/f/c/f;->MotionLayout_applyMotionScene:I

    if-ne v6, v7, :cond_57

    .line 227
    invoke-virtual {p1, v6, v5}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v5

    goto :goto_75

    .line 228
    :cond_57
    sget v7, Lb/f/c/f;->MotionLayout_showPaths:I

    if-ne v6, v7, :cond_6b

    .line 229
    iget v7, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->T:I

    if-nez v7, :cond_75

    .line 230
    invoke-virtual {p1, v6, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v6

    if-eqz v6, :cond_67

    const/4 v6, 0x2

    goto :goto_68

    :cond_67
    const/4 v6, 0x0

    :goto_68
    iput v6, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->T:I

    goto :goto_75

    .line 231
    :cond_6b
    sget v7, Lb/f/c/f;->MotionLayout_motionDebug:I

    if-ne v6, v7, :cond_75

    .line 232
    invoke-virtual {p1, v6, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v6

    iput v6, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->T:I

    :cond_75
    :goto_75
    add-int/lit8 v4, v4, 0x1

    goto :goto_1b

    .line 233
    :cond_78
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 234
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    if-nez p1, :cond_86

    const-string p1, "MotionLayout"

    const-string v1, "WARNING NO app:layoutDescription tag"

    .line 235
    invoke-static {p1, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_86
    if-nez v5, :cond_8b

    const/4 p1, 0x0

    .line 236
    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    .line 237
    :cond_8b
    iget p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->T:I

    if-eqz p1, :cond_92

    .line 238
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->e()V

    .line 239
    :cond_92
    iget p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C:I

    if-ne p1, v0, :cond_b0

    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    if-eqz p1, :cond_b0

    .line 240
    invoke-virtual {p1}, Lb/f/a/b/q;->k()I

    move-result p1

    iput p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C:I

    .line 241
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    invoke-virtual {p1}, Lb/f/a/b/q;->k()I

    move-result p1

    iput p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->B:I

    .line 242
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    invoke-virtual {p1}, Lb/f/a/b/q;->e()I

    move-result p1

    iput p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->D:I

    :cond_b0
    return-void
.end method

.method public a(Landroid/view/View;FF[FI)V
    .registers 14

    .line 80
    iget v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->A:F

    .line 81
    iget v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->L:F

    .line 82
    iget-object v2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->z:Landroid/view/animation/Interpolator;

    if-eqz v2, :cond_2d

    const v0, 0x3727c5ac    # 1.0E-5f

    .line 83
    iget v2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->N:F

    sub-float/2addr v2, v1

    invoke-static {v2}, Ljava/lang/Math;->signum(F)F

    move-result v1

    .line 84
    iget-object v2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->z:Landroid/view/animation/Interpolator;

    iget v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->L:F

    add-float/2addr v3, v0

    invoke-interface {v2, v3}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v2

    .line 85
    iget-object v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->z:Landroid/view/animation/Interpolator;

    iget v4, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->L:F

    invoke-interface {v3, v4}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v3

    sub-float/2addr v2, v3

    div-float/2addr v2, v0

    mul-float v1, v1, v2

    .line 86
    iget v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->J:F

    div-float v0, v1, v0

    move v2, v3

    goto :goto_2e

    :cond_2d
    move v2, v1

    .line 87
    :goto_2e
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->z:Landroid/view/animation/Interpolator;

    instance-of v3, v1, Lb/f/a/b/o;

    if-eqz v3, :cond_3a

    .line 88
    check-cast v1, Lb/f/a/b/o;

    invoke-virtual {v1}, Lb/f/a/b/o;->a()F

    move-result v0

    .line 89
    :cond_3a
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->H:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/f/a/b/n;

    and-int/lit8 v3, p5, 0x1

    if-nez v3, :cond_55

    .line 90
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v3

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v4

    move v5, p2

    move v6, p3

    move-object v7, p4

    .line 91
    invoke-virtual/range {v1 .. v7}, Lb/f/a/b/n;->a(FIIFF[F)V

    goto :goto_58

    .line 92
    :cond_55
    invoke-virtual {v1, v2, p2, p3, p4}, Lb/f/a/b/n;->a(FFF[F)V

    :goto_58
    const/4 p1, 0x2

    if-ge p5, p1, :cond_69

    const/4 p1, 0x0

    .line 93
    aget p2, p4, p1

    mul-float p2, p2, v0

    aput p2, p4, p1

    const/4 p1, 0x1

    .line 94
    aget p2, p4, p1

    mul-float p2, p2, v0

    aput p2, p4, p1

    :cond_69
    return-void
.end method

.method public a(Landroid/view/View;I)V
    .registers 5

    .line 95
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    if-nez p1, :cond_5

    return-void

    .line 96
    :cond_5
    iget p2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->f0:F

    iget v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->i0:F

    div-float/2addr p2, v0

    iget v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->g0:F

    div-float/2addr v1, v0

    invoke-virtual {p1, p2, v1}, Lb/f/a/b/q;->c(FF)V

    return-void
.end method

.method public a(Landroid/view/View;IIIII)V
    .registers 7

    return-void
.end method

.method public a(Landroid/view/View;IIIII[I)V
    .registers 8

    .line 97
    iget-boolean p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->e0:Z

    const/4 p6, 0x0

    if-nez p1, :cond_9

    if-nez p2, :cond_9

    if-eqz p3, :cond_14

    .line 98
    :cond_9
    aget p1, p7, p6

    add-int/2addr p1, p4

    aput p1, p7, p6

    const/4 p1, 0x1

    .line 99
    aget p2, p7, p1

    add-int/2addr p2, p5

    aput p2, p7, p1

    .line 100
    :cond_14
    iput-boolean p6, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->e0:Z

    return-void
.end method

.method public a(Landroid/view/View;II[II)V
    .registers 15

    .line 101
    iget-object p5, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    if-eqz p5, :cond_cd

    iget-object p5, p5, Lb/f/a/b/q;->c:Lb/f/a/b/q$b;

    if-nez p5, :cond_a

    goto/16 :goto_cd

    .line 102
    :cond_a
    invoke-virtual {p5}, Lb/f/a/b/q$b;->f()Z

    move-result p5

    if-nez p5, :cond_11

    return-void

    .line 103
    :cond_11
    iget-object p5, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    iget-object p5, p5, Lb/f/a/b/q;->c:Lb/f/a/b/q$b;

    const/4 v0, -0x1

    if-eqz p5, :cond_31

    .line 104
    invoke-virtual {p5}, Lb/f/a/b/q$b;->f()Z

    move-result v1

    if-eqz v1, :cond_31

    .line 105
    invoke-virtual {p5}, Lb/f/a/b/q$b;->e()Lb/f/a/b/t;

    move-result-object v1

    if-eqz v1, :cond_31

    .line 106
    invoke-virtual {v1}, Lb/f/a/b/t;->e()I

    move-result v1

    if-eq v1, v0, :cond_31

    .line 107
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v2

    if-eq v2, v1, :cond_31

    return-void

    .line 108
    :cond_31
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v3, 0x0

    if-eqz v1, :cond_4f

    invoke-virtual {v1}, Lb/f/a/b/q;->i()Z

    move-result v1

    if-eqz v1, :cond_4f

    .line 109
    iget v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->K:F

    cmpl-float v4, v1, v2

    if-eqz v4, :cond_48

    cmpl-float v1, v1, v3

    if-nez v1, :cond_4f

    :cond_48
    invoke-virtual {p1, v0}, Landroid/view/View;->canScrollVertically(I)Z

    move-result v0

    if-eqz v0, :cond_4f

    return-void

    .line 110
    :cond_4f
    invoke-virtual {p5}, Lb/f/a/b/q$b;->e()Lb/f/a/b/t;

    move-result-object p5

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p5, :cond_94

    iget-object p5, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    iget-object p5, p5, Lb/f/a/b/q;->c:Lb/f/a/b/q$b;

    invoke-virtual {p5}, Lb/f/a/b/q$b;->e()Lb/f/a/b/t;

    move-result-object p5

    invoke-virtual {p5}, Lb/f/a/b/t;->a()I

    move-result p5

    and-int/2addr p5, v1

    if-eqz p5, :cond_94

    .line 111
    iget-object p5, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    int-to-float v4, p2

    int-to-float v5, p3

    invoke-virtual {p5, v4, v5}, Lb/f/a/b/q;->a(FF)F

    move-result p5

    .line 112
    iget v4, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->L:F

    cmpg-float v4, v4, v3

    if-gtz v4, :cond_78

    cmpg-float v4, p5, v3

    if-ltz v4, :cond_82

    :cond_78
    iget v4, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->L:F

    cmpl-float v2, v4, v2

    if-ltz v2, :cond_94

    cmpl-float p5, p5, v3

    if-lez p5, :cond_94

    .line 113
    :cond_82
    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 p3, 0x15

    if-lt p2, p3, :cond_93

    .line 114
    invoke-virtual {p1, v0}, Landroid/view/View;->setNestedScrollingEnabled(Z)V

    .line 115
    new-instance p2, Landroidx/constraintlayout/motion/widget/MotionLayout$a;

    invoke-direct {p2, p0, p1}, Landroidx/constraintlayout/motion/widget/MotionLayout$a;-><init>(Landroidx/constraintlayout/motion/widget/MotionLayout;Landroid/view/View;)V

    invoke-virtual {p1, p2}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    :cond_93
    return-void

    .line 116
    :cond_94
    iget p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->K:F

    .line 117
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->getNanoTime()J

    move-result-wide v2

    int-to-float p5, p2

    .line 118
    iput p5, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->f0:F

    int-to-float v4, p3

    .line 119
    iput v4, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->g0:F

    .line 120
    iget-wide v5, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->h0:J

    sub-long v5, v2, v5

    long-to-double v5, v5

    const-wide v7, 0x3e112e0be826d695L    # 1.0E-9

    mul-double v5, v5, v7

    double-to-float v5, v5

    iput v5, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->i0:F

    .line 121
    iput-wide v2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->h0:J

    .line 122
    iget-object v2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    invoke-virtual {v2, p5, v4}, Lb/f/a/b/q;->b(FF)V

    .line 123
    iget p5, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->K:F

    cmpl-float p1, p1, p5

    if-eqz p1, :cond_c0

    .line 124
    aput p2, p4, v0

    .line 125
    aput p3, p4, v1

    .line 126
    :cond_c0
    invoke-virtual {p0, v0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->a(Z)V

    .line 127
    aget p1, p4, v0

    if-nez p1, :cond_cb

    aget p1, p4, v1

    if-eqz p1, :cond_cd

    .line 128
    :cond_cb
    iput-boolean v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->e0:Z

    :cond_cd
    :goto_cd
    return-void
.end method

.method public a(Landroid/view/View;Landroid/view/View;II)V
    .registers 5

    return-void
.end method

.method public final a(Lb/f/a/b/q$b;)V
    .registers 5

    .line 262
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "CHECK: transition = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p1, v1}, Lb/f/a/b/q$b;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "MotionLayout"

    invoke-static {v1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 263
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "CHECK: transition.setDuration = "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lb/f/a/b/q$b;->a()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 264
    invoke-virtual {p1}, Lb/f/a/b/q$b;->d()I

    move-result v0

    invoke-virtual {p1}, Lb/f/a/b/q$b;->b()I

    move-result p1

    if-ne v0, p1, :cond_45

    const-string p1, "CHECK: start and end constraint set should not be the same!"

    .line 265
    invoke-static {v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_45
    return-void
.end method

.method public a(Z)V
    .registers 24

    move-object/from16 v0, p0

    .line 129
    iget-wide v1, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->M:J

    const-wide/16 v3, -0x1

    cmp-long v5, v1, v3

    if-nez v5, :cond_10

    .line 130
    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->getNanoTime()J

    move-result-wide v1

    iput-wide v1, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->M:J

    .line 131
    :cond_10
    iget v1, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->L:F

    const/4 v2, -0x1

    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v4, 0x0

    cmpl-float v5, v1, v4

    if-lez v5, :cond_20

    cmpg-float v1, v1, v3

    if-gez v1, :cond_20

    .line 132
    iput v2, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C:I

    .line 133
    :cond_20
    iget-boolean v1, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->j0:Z

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-nez v1, :cond_34

    iget-boolean v1, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->P:Z

    if-eqz v1, :cond_206

    if-nez p1, :cond_34

    iget v1, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->N:F

    iget v7, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->L:F

    cmpl-float v1, v1, v7

    if-eqz v1, :cond_206

    .line 134
    :cond_34
    iget v1, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->N:F

    iget v7, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->L:F

    sub-float/2addr v1, v7

    invoke-static {v1}, Ljava/lang/Math;->signum(F)F

    move-result v1

    .line 135
    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->getNanoTime()J

    move-result-wide v7

    .line 136
    iget-object v9, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->z:Landroid/view/animation/Interpolator;

    instance-of v9, v9, Lb/f/a/b/o;

    const v10, 0x3089705f    # 1.0E-9f

    if-nez v9, :cond_59

    .line 137
    iget-wide v11, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->M:J

    sub-long v11, v7, v11

    long-to-float v9, v11

    mul-float v9, v9, v1

    mul-float v9, v9, v10

    iget v11, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->J:F

    div-float/2addr v9, v11

    .line 138
    iput v9, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->A:F

    goto :goto_5a

    :cond_59
    const/4 v9, 0x0

    .line 139
    :goto_5a
    iget v11, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->L:F

    add-float/2addr v11, v9

    .line 140
    iget-boolean v12, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->O:Z

    if-eqz v12, :cond_63

    .line 141
    iget v11, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->N:F

    :cond_63
    cmpl-float v12, v1, v4

    if-lez v12, :cond_6d

    .line 142
    iget v13, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->N:F

    cmpl-float v13, v11, v13

    if-gez v13, :cond_77

    :cond_6d
    cmpg-float v13, v1, v4

    if-gtz v13, :cond_7d

    iget v13, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->N:F

    cmpg-float v13, v11, v13

    if-gtz v13, :cond_7d

    .line 143
    :cond_77
    iget v11, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->N:F

    .line 144
    iput-boolean v6, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->P:Z

    const/4 v13, 0x1

    goto :goto_7e

    :cond_7d
    const/4 v13, 0x0

    .line 145
    :goto_7e
    iput v11, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->L:F

    .line 146
    iput v11, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->K:F

    .line 147
    iput-wide v7, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->M:J

    .line 148
    iget-object v14, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->z:Landroid/view/animation/Interpolator;

    const v15, 0x3727c5ac    # 1.0E-5f

    if-eqz v14, :cond_f9

    if-nez v13, :cond_f9

    .line 149
    iget-boolean v13, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->V:Z

    if-eqz v13, :cond_da

    .line 150
    iget-wide v2, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->I:J

    sub-long v2, v7, v2

    long-to-float v2, v2

    mul-float v2, v2, v10

    .line 151
    invoke-interface {v14, v2}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v2

    .line 152
    iput v2, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->L:F

    .line 153
    iput-wide v7, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->M:J

    .line 154
    iget-object v3, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->z:Landroid/view/animation/Interpolator;

    instance-of v7, v3, Lb/f/a/b/o;

    if-eqz v7, :cond_f8

    .line 155
    check-cast v3, Lb/f/a/b/o;

    invoke-virtual {v3}, Lb/f/a/b/o;->a()F

    move-result v3

    .line 156
    iput v3, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->A:F

    .line 157
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v7

    iget v8, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->J:F

    mul-float v7, v7, v8

    cmpg-float v7, v7, v15

    if-gtz v7, :cond_bc

    .line 158
    iput-boolean v6, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->P:Z

    :cond_bc
    cmpl-float v7, v3, v4

    if-lez v7, :cond_cc

    const/high16 v7, 0x3f800000    # 1.0f

    cmpl-float v8, v2, v7

    if-ltz v8, :cond_cc

    .line 159
    iput v7, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->L:F

    .line 160
    iput-boolean v6, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->P:Z

    const/high16 v2, 0x3f800000    # 1.0f

    :cond_cc
    cmpg-float v3, v3, v4

    if-gez v3, :cond_f8

    cmpg-float v3, v2, v4

    if-gtz v3, :cond_f8

    .line 161
    iput v4, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->L:F

    .line 162
    iput-boolean v6, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->P:Z

    const/4 v11, 0x0

    goto :goto_f9

    .line 163
    :cond_da
    invoke-interface {v14, v11}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v2

    .line 164
    iget-object v3, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->z:Landroid/view/animation/Interpolator;

    instance-of v7, v3, Lb/f/a/b/o;

    if-eqz v7, :cond_ed

    .line 165
    check-cast v3, Lb/f/a/b/o;

    invoke-virtual {v3}, Lb/f/a/b/o;->a()F

    move-result v3

    iput v3, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->A:F

    goto :goto_f8

    :cond_ed
    add-float/2addr v11, v9

    .line 166
    invoke-interface {v3, v11}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v3

    sub-float/2addr v3, v2

    mul-float v3, v3, v1

    div-float/2addr v3, v9

    .line 167
    iput v3, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->A:F

    :cond_f8
    :goto_f8
    move v11, v2

    .line 168
    :cond_f9
    :goto_f9
    iget v2, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->A:F

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    cmpl-float v2, v2, v15

    if-lez v2, :cond_108

    .line 169
    sget-object v2, Landroidx/constraintlayout/motion/widget/MotionLayout$j;->MOVING:Landroidx/constraintlayout/motion/widget/MotionLayout$j;

    invoke-virtual {v0, v2}, Landroidx/constraintlayout/motion/widget/MotionLayout;->setState(Landroidx/constraintlayout/motion/widget/MotionLayout$j;)V

    :cond_108
    if-lez v12, :cond_110

    .line 170
    iget v2, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->N:F

    cmpl-float v2, v11, v2

    if-gez v2, :cond_11a

    :cond_110
    cmpg-float v2, v1, v4

    if-gtz v2, :cond_11e

    iget v2, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->N:F

    cmpg-float v2, v11, v2

    if-gtz v2, :cond_11e

    .line 171
    :cond_11a
    iget v11, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->N:F

    .line 172
    iput-boolean v6, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->P:Z

    :cond_11e
    const/high16 v2, 0x3f800000    # 1.0f

    cmpl-float v3, v11, v2

    if-gez v3, :cond_128

    cmpg-float v2, v11, v4

    if-gtz v2, :cond_12f

    .line 173
    :cond_128
    iput-boolean v6, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->P:Z

    .line 174
    sget-object v2, Landroidx/constraintlayout/motion/widget/MotionLayout$j;->FINISHED:Landroidx/constraintlayout/motion/widget/MotionLayout$j;

    invoke-virtual {v0, v2}, Landroidx/constraintlayout/motion/widget/MotionLayout;->setState(Landroidx/constraintlayout/motion/widget/MotionLayout$j;)V

    .line 175
    :cond_12f
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    .line 176
    iput-boolean v6, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->j0:Z

    .line 177
    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->getNanoTime()J

    move-result-wide v7

    .line 178
    iput v11, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->z0:F

    const/4 v9, 0x0

    :goto_13c
    if-ge v9, v2, :cond_164

    .line 179
    invoke-virtual {v0, v9}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v10

    .line 180
    iget-object v14, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->H:Ljava/util/HashMap;

    invoke-virtual {v14, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    move-object/from16 v16, v14

    check-cast v16, Lb/f/a/b/n;

    if-eqz v16, :cond_161

    .line 181
    iget-boolean v14, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->j0:Z

    iget-object v15, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->A0:Lb/f/a/b/e;

    move-object/from16 v17, v10

    move/from16 v18, v11

    move-wide/from16 v19, v7

    move-object/from16 v21, v15

    invoke-virtual/range {v16 .. v21}, Lb/f/a/b/n;->a(Landroid/view/View;FJLb/f/a/b/e;)Z

    move-result v10

    or-int/2addr v10, v14

    iput-boolean v10, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->j0:Z

    :cond_161
    add-int/lit8 v9, v9, 0x1

    goto :goto_13c

    :cond_164
    if-lez v12, :cond_16c

    .line 182
    iget v2, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->N:F

    cmpl-float v2, v11, v2

    if-gez v2, :cond_176

    :cond_16c
    cmpg-float v2, v1, v4

    if-gtz v2, :cond_178

    iget v2, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->N:F

    cmpg-float v2, v11, v2

    if-gtz v2, :cond_178

    :cond_176
    const/4 v2, 0x1

    goto :goto_179

    :cond_178
    const/4 v2, 0x0

    .line 183
    :goto_179
    iget-boolean v7, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->j0:Z

    if-nez v7, :cond_188

    iget-boolean v7, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->P:Z

    if-nez v7, :cond_188

    if-eqz v2, :cond_188

    .line 184
    sget-object v7, Landroidx/constraintlayout/motion/widget/MotionLayout$j;->FINISHED:Landroidx/constraintlayout/motion/widget/MotionLayout$j;

    invoke-virtual {v0, v7}, Landroidx/constraintlayout/motion/widget/MotionLayout;->setState(Landroidx/constraintlayout/motion/widget/MotionLayout$j;)V

    .line 185
    :cond_188
    iget-boolean v7, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->s0:Z

    if-eqz v7, :cond_18f

    .line 186
    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->requestLayout()V

    .line 187
    :cond_18f
    iget-boolean v7, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->j0:Z

    xor-int/2addr v2, v5

    or-int/2addr v2, v7

    iput-boolean v2, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->j0:Z

    cmpg-float v2, v11, v4

    if-gtz v2, :cond_1b3

    .line 188
    iget v2, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->B:I

    const/4 v7, -0x1

    if-eq v2, v7, :cond_1b3

    .line 189
    iget v7, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C:I

    if-eq v7, v2, :cond_1b3

    .line 190
    iput v2, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C:I

    .line 191
    iget-object v6, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    invoke-virtual {v6, v2}, Lb/f/a/b/q;->a(I)Lb/f/c/c;

    move-result-object v2

    .line 192
    invoke-virtual {v2, v0}, Lb/f/c/c;->a(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    .line 193
    sget-object v2, Landroidx/constraintlayout/motion/widget/MotionLayout$j;->FINISHED:Landroidx/constraintlayout/motion/widget/MotionLayout$j;

    invoke-virtual {v0, v2}, Landroidx/constraintlayout/motion/widget/MotionLayout;->setState(Landroidx/constraintlayout/motion/widget/MotionLayout$j;)V

    const/4 v6, 0x1

    :cond_1b3
    float-to-double v7, v11

    const-wide/high16 v9, 0x3ff0000000000000L    # 1.0

    cmpl-double v2, v7, v9

    if-ltz v2, :cond_1d1

    .line 194
    iget v2, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C:I

    iget v7, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->D:I

    if-eq v2, v7, :cond_1d1

    .line 195
    iput v7, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C:I

    .line 196
    iget-object v2, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    invoke-virtual {v2, v7}, Lb/f/a/b/q;->a(I)Lb/f/c/c;

    move-result-object v2

    .line 197
    invoke-virtual {v2, v0}, Lb/f/c/c;->a(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    .line 198
    sget-object v2, Landroidx/constraintlayout/motion/widget/MotionLayout$j;->FINISHED:Landroidx/constraintlayout/motion/widget/MotionLayout$j;

    invoke-virtual {v0, v2}, Landroidx/constraintlayout/motion/widget/MotionLayout;->setState(Landroidx/constraintlayout/motion/widget/MotionLayout$j;)V

    const/4 v6, 0x1

    .line 199
    :cond_1d1
    iget-boolean v2, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->j0:Z

    if-nez v2, :cond_1ec

    iget-boolean v2, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->P:Z

    if-eqz v2, :cond_1da

    goto :goto_1ec

    :cond_1da
    if-lez v12, :cond_1de

    if-eqz v3, :cond_1e6

    :cond_1de
    cmpg-float v2, v1, v4

    if-gez v2, :cond_1ef

    cmpl-float v2, v11, v4

    if-nez v2, :cond_1ef

    .line 200
    :cond_1e6
    sget-object v2, Landroidx/constraintlayout/motion/widget/MotionLayout$j;->FINISHED:Landroidx/constraintlayout/motion/widget/MotionLayout$j;

    invoke-virtual {v0, v2}, Landroidx/constraintlayout/motion/widget/MotionLayout;->setState(Landroidx/constraintlayout/motion/widget/MotionLayout$j;)V

    goto :goto_1ef

    .line 201
    :cond_1ec
    :goto_1ec
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->invalidate()V

    .line 202
    :cond_1ef
    :goto_1ef
    iget-boolean v2, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->j0:Z

    if-nez v2, :cond_1fb

    iget-boolean v2, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->P:Z

    if-eqz v2, :cond_1fb

    if-lez v12, :cond_1fb

    if-eqz v3, :cond_203

    :cond_1fb
    cmpg-float v1, v1, v4

    if-gez v1, :cond_206

    cmpl-float v1, v11, v4

    if-nez v1, :cond_206

    .line 203
    :cond_203
    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->l()V

    .line 204
    :cond_206
    iget v1, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->L:F

    const/high16 v2, 0x3f800000    # 1.0f

    cmpl-float v2, v1, v2

    if-ltz v2, :cond_21c

    .line 205
    iget v1, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C:I

    iget v2, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->D:I

    if-eq v1, v2, :cond_215

    goto :goto_216

    :cond_215
    move v5, v6

    .line 206
    :goto_216
    iget v1, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->D:I

    iput v1, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C:I

    :goto_21a
    move v6, v5

    goto :goto_22d

    :cond_21c
    cmpg-float v1, v1, v4

    if-gtz v1, :cond_22d

    .line 207
    iget v1, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C:I

    iget v2, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->B:I

    if-eq v1, v2, :cond_227

    goto :goto_228

    :cond_227
    move v5, v6

    .line 208
    :goto_228
    iget v1, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->B:I

    iput v1, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C:I

    goto :goto_21a

    .line 209
    :cond_22d
    :goto_22d
    iget-boolean v1, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->F0:Z

    or-int/2addr v1, v6

    iput-boolean v1, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->F0:Z

    if-eqz v6, :cond_23b

    .line 210
    iget-boolean v1, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->B0:Z

    if-nez v1, :cond_23b

    .line 211
    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->requestLayout()V

    .line 212
    :cond_23b
    iget v1, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->L:F

    iput v1, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->K:F

    return-void
.end method

.method public final a(FFLandroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 13

    .line 266
    instance-of v0, p3, Landroid/view/ViewGroup;

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_2a

    .line 267
    move-object v0, p3

    check-cast v0, Landroid/view/ViewGroup;

    .line 268
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    const/4 v4, 0x0

    :goto_e
    if-ge v4, v3, :cond_2a

    .line 269
    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 270
    invoke-virtual {p3}, Landroid/view/View;->getLeft()I

    move-result v6

    int-to-float v6, v6

    add-float/2addr v6, p1

    invoke-virtual {p3}, Landroid/view/View;->getTop()I

    move-result v7

    int-to-float v7, v7

    add-float/2addr v7, p2

    invoke-virtual {p0, v6, v7, v5, p4}, Landroidx/constraintlayout/motion/widget/MotionLayout;->a(FFLandroid/view/View;Landroid/view/MotionEvent;)Z

    move-result v5

    if-eqz v5, :cond_27

    return v2

    :cond_27
    add-int/lit8 v4, v4, 0x1

    goto :goto_e

    .line 271
    :cond_2a
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->G0:Landroid/graphics/RectF;

    invoke-virtual {p3}, Landroid/view/View;->getLeft()I

    move-result v3

    int-to-float v3, v3

    add-float/2addr v3, p1

    invoke-virtual {p3}, Landroid/view/View;->getTop()I

    move-result v4

    int-to-float v4, v4

    add-float/2addr v4, p2

    invoke-virtual {p3}, Landroid/view/View;->getRight()I

    move-result v5

    int-to-float v5, v5

    add-float/2addr p1, v5

    invoke-virtual {p3}, Landroid/view/View;->getBottom()I

    move-result v5

    int-to-float v5, v5

    add-float/2addr p2, v5

    invoke-virtual {v0, v3, v4, p1, p2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 272
    invoke-virtual {p4}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    if-nez p1, :cond_64

    .line 273
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->G0:Landroid/graphics/RectF;

    invoke-virtual {p4}, Landroid/view/MotionEvent;->getX()F

    move-result p2

    invoke-virtual {p4}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    invoke-virtual {p1, p2, v0}, Landroid/graphics/RectF;->contains(FF)Z

    move-result p1

    if-eqz p1, :cond_6b

    .line 274
    invoke-virtual {p3, p4}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    if-eqz p1, :cond_6b

    return v2

    .line 275
    :cond_64
    invoke-virtual {p3, p4}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    if-eqz p1, :cond_6b

    return v2

    :cond_6b
    return v1
.end method

.method public b(III)V
    .registers 15

    .line 3
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    const/4 v1, -0x1

    if-eqz v0, :cond_14

    iget-object v0, v0, Lb/f/a/b/q;->b:Lb/f/c/g;

    if-eqz v0, :cond_14

    .line 4
    iget v2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C:I

    int-to-float p2, p2

    int-to-float p3, p3

    invoke-virtual {v0, v2, p1, p2, p3}, Lb/f/c/g;->a(IIFF)I

    move-result p2

    if-eq p2, v1, :cond_14

    move p1, p2

    .line 5
    :cond_14
    iget p2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C:I

    if-ne p2, p1, :cond_19

    return-void

    .line 6
    :cond_19
    iget p3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->B:I

    const/4 v0, 0x0

    if-ne p3, p1, :cond_22

    .line 7
    invoke-virtual {p0, v0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->a(F)V

    return-void

    .line 8
    :cond_22
    iget p3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->D:I

    const/high16 v2, 0x3f800000    # 1.0f

    if-ne p3, p1, :cond_2c

    .line 9
    invoke-virtual {p0, v2}, Landroidx/constraintlayout/motion/widget/MotionLayout;->a(F)V

    return-void

    .line 10
    :cond_2c
    iput p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->D:I

    if-eq p2, v1, :cond_3c

    .line 11
    invoke-virtual {p0, p2, p1}, Landroidx/constraintlayout/motion/widget/MotionLayout;->a(II)V

    .line 12
    invoke-virtual {p0, v2}, Landroidx/constraintlayout/motion/widget/MotionLayout;->a(F)V

    .line 13
    iput v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->L:F

    .line 14
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->p()V

    return-void

    :cond_3c
    const/4 p2, 0x0

    .line 15
    iput-boolean p2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->V:Z

    .line 16
    iput v2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->N:F

    .line 17
    iput v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->K:F

    .line 18
    iput v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->L:F

    .line 19
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->getNanoTime()J

    move-result-wide v3

    iput-wide v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->M:J

    .line 20
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->getNanoTime()J

    move-result-wide v3

    iput-wide v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->I:J

    .line 21
    iput-boolean p2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->O:Z

    const/4 p3, 0x0

    .line 22
    iput-object p3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->z:Landroid/view/animation/Interpolator;

    .line 23
    iget-object v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    invoke-virtual {v3}, Lb/f/a/b/q;->d()I

    move-result v3

    int-to-float v3, v3

    const/high16 v4, 0x447a0000    # 1000.0f

    div-float/2addr v3, v4

    iput v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->J:F

    .line 24
    iput v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->B:I

    .line 25
    iget-object v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    iget v4, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->D:I

    invoke-virtual {v3, v1, v4}, Lb/f/a/b/q;->a(II)V

    .line 26
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    invoke-virtual {v1}, Lb/f/a/b/q;->k()I

    .line 27
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    .line 28
    iget-object v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->H:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->clear()V

    const/4 v3, 0x0

    :goto_7a
    if-ge v3, v1, :cond_8d

    .line 29
    invoke-virtual {p0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 30
    new-instance v5, Lb/f/a/b/n;

    invoke-direct {v5, v4}, Lb/f/a/b/n;-><init>(Landroid/view/View;)V

    .line 31
    iget-object v6, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->H:Ljava/util/HashMap;

    invoke-virtual {v6, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v3, v3, 0x1

    goto :goto_7a

    :cond_8d
    const/4 v3, 0x1

    .line 32
    iput-boolean v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->P:Z

    .line 33
    iget-object v4, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->E0:Landroidx/constraintlayout/motion/widget/MotionLayout$e;

    iget-object v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->j:Lb/f/b/k/f;

    iget-object v6, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    invoke-virtual {v6, p1}, Lb/f/a/b/q;->a(I)Lb/f/c/c;

    move-result-object p1

    invoke-virtual {v4, v5, p3, p1}, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->a(Lb/f/b/k/f;Lb/f/c/c;Lb/f/c/c;)V

    .line 34
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->n()V

    .line 35
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->E0:Landroidx/constraintlayout/motion/widget/MotionLayout$e;

    invoke-virtual {p1}, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->a()V

    .line 36
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->f()V

    .line 37
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    move-result p1

    .line 38
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    move-result p3

    const/4 v10, 0x0

    :goto_b1
    if-ge v10, v1, :cond_d2

    .line 39
    iget-object v4, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->H:Ljava/util/HashMap;

    invoke-virtual {p0, v10}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lb/f/a/b/n;

    .line 40
    iget-object v5, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    invoke-virtual {v5, v4}, Lb/f/a/b/q;->a(Lb/f/a/b/n;)V

    .line 41
    iget v7, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->J:F

    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->getNanoTime()J

    move-result-wide v8

    move v5, p1

    move v6, p3

    invoke-virtual/range {v4 .. v9}, Lb/f/a/b/n;->a(IIFJ)V

    add-int/lit8 v10, v10, 0x1

    goto :goto_b1

    .line 42
    :cond_d2
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    invoke-virtual {p1}, Lb/f/a/b/q;->j()F

    move-result p1

    cmpl-float p3, p1, v0

    if-eqz p3, :cond_12f

    const p3, 0x7f7fffff    # Float.MAX_VALUE

    const v4, -0x800001

    const/4 v5, 0x0

    :goto_e3
    if-ge v5, v1, :cond_105

    .line 43
    iget-object v6, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->H:Ljava/util/HashMap;

    invoke-virtual {p0, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lb/f/a/b/n;

    .line 44
    invoke-virtual {v6}, Lb/f/a/b/n;->b()F

    move-result v7

    .line 45
    invoke-virtual {v6}, Lb/f/a/b/n;->c()F

    move-result v6

    add-float/2addr v6, v7

    .line 46
    invoke-static {p3, v6}, Ljava/lang/Math;->min(FF)F

    move-result p3

    .line 47
    invoke-static {v4, v6}, Ljava/lang/Math;->max(FF)F

    move-result v4

    add-int/lit8 v5, v5, 0x1

    goto :goto_e3

    :cond_105
    :goto_105
    if-ge p2, v1, :cond_12f

    .line 48
    iget-object v5, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->H:Ljava/util/HashMap;

    invoke-virtual {p0, p2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lb/f/a/b/n;

    .line 49
    invoke-virtual {v5}, Lb/f/a/b/n;->b()F

    move-result v6

    .line 50
    invoke-virtual {v5}, Lb/f/a/b/n;->c()F

    move-result v7

    sub-float v8, v2, p1

    div-float v8, v2, v8

    .line 51
    iput v8, v5, Lb/f/a/b/n;->l:F

    add-float/2addr v6, v7

    sub-float/2addr v6, p3

    mul-float v6, v6, p1

    sub-float v7, v4, p3

    div-float/2addr v6, v7

    sub-float v6, p1, v6

    .line 52
    iput v6, v5, Lb/f/a/b/n;->k:F

    add-int/lit8 p2, p2, 0x1

    goto :goto_105

    .line 53
    :cond_12f
    iput v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->K:F

    .line 54
    iput v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->L:F

    .line 55
    iput-boolean v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->P:Z

    .line 56
    invoke-virtual {p0}, Landroid/view/ViewGroup;->invalidate()V

    return-void
.end method

.method public b(Landroid/view/View;Landroid/view/View;II)Z
    .registers 5

    .line 57
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    if-eqz p1, :cond_21

    iget-object p1, p1, Lb/f/a/b/q;->c:Lb/f/a/b/q$b;

    if-eqz p1, :cond_21

    .line 58
    invoke-virtual {p1}, Lb/f/a/b/q$b;->e()Lb/f/a/b/t;

    move-result-object p1

    if-eqz p1, :cond_21

    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    iget-object p1, p1, Lb/f/a/b/q;->c:Lb/f/a/b/q$b;

    .line 59
    invoke-virtual {p1}, Lb/f/a/b/q$b;->e()Lb/f/a/b/t;

    move-result-object p1

    invoke-virtual {p1}, Lb/f/a/b/t;->a()I

    move-result p1

    and-int/lit8 p1, p1, 0x2

    if-eqz p1, :cond_1f

    goto :goto_21

    :cond_1f
    const/4 p1, 0x1

    return p1

    :cond_21
    :goto_21
    const/4 p1, 0x0

    return p1
.end method

.method public c(I)V
    .registers 2

    const/4 p1, 0x0

    .line 3
    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->r:Lb/f/c/b;

    return-void
.end method

.method public d(I)Lb/f/a/b/q$b;
    .registers 3

    .line 3
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    invoke-virtual {v0, p1}, Lb/f/a/b/q;->c(I)Lb/f/a/b/q$b;

    move-result-object p1

    return-object p1
.end method

.method public dispatchDraw(Landroid/graphics/Canvas;)V
    .registers 11

    const/4 v0, 0x0

    .line 1
    invoke-virtual {p0, v0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->a(Z)V

    .line 2
    invoke-super {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 3
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    if-nez v1, :cond_c

    return-void

    .line 4
    :cond_c
    iget v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->T:I

    const/4 v2, 0x1

    and-int/2addr v1, v2

    if-ne v1, v2, :cond_d6

    .line 5
    invoke-virtual {p0}, Landroid/view/ViewGroup;->isInEditMode()Z

    move-result v1

    if-nez v1, :cond_d6

    .line 6
    iget v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->n0:I

    add-int/2addr v1, v2

    iput v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->n0:I

    .line 7
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->getNanoTime()J

    move-result-wide v3

    .line 8
    iget-wide v5, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->o0:J

    const-wide/16 v7, -0x1

    cmp-long v1, v5, v7

    if-eqz v1, :cond_4a

    sub-long v5, v3, v5

    const-wide/32 v7, 0xbebc200

    cmp-long v1, v5, v7

    if-lez v1, :cond_4c

    .line 9
    iget v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->n0:I

    int-to-float v1, v1

    long-to-float v5, v5

    const v6, 0x3089705f    # 1.0E-9f

    mul-float v5, v5, v6

    div-float/2addr v1, v5

    const/high16 v5, 0x42c80000    # 100.0f

    mul-float v1, v1, v5

    float-to-int v1, v1

    int-to-float v1, v1

    div-float/2addr v1, v5

    .line 10
    iput v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->p0:F

    .line 11
    iput v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->n0:I

    .line 12
    iput-wide v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->o0:J

    goto :goto_4c

    .line 13
    :cond_4a
    iput-wide v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->o0:J

    .line 14
    :cond_4c
    :goto_4c
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    const/high16 v1, 0x42280000    # 42.0f

    .line 15
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 16
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->getProgress()F

    move-result v1

    const/high16 v3, 0x447a0000    # 1000.0f

    mul-float v1, v1, v3

    float-to-int v1, v1

    int-to-float v1, v1

    const/high16 v3, 0x41200000    # 10.0f

    div-float/2addr v1, v3

    .line 17
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget v5, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->p0:F

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v5, " fps "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v5, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->B:I

    invoke-static {p0, v5}, Lb/f/a/b/a;->a(Landroidx/constraintlayout/motion/widget/MotionLayout;I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " -> "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 18
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v4, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->D:I

    invoke-static {p0, v4}, Lb/f/a/b/a;->a(Landroidx/constraintlayout/motion/widget/MotionLayout;I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " (progress: "

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, " ) state="

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C:I

    const/4 v4, -0x1

    if-ne v1, v4, :cond_aa

    const-string v1, "undefined"

    goto :goto_ae

    .line 19
    :cond_aa
    invoke-static {p0, v1}, Lb/f/a/b/a;->a(Landroidx/constraintlayout/motion/widget/MotionLayout;I)Ljava/lang/String;

    move-result-object v1

    :goto_ae
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/high16 v4, -0x1000000

    .line 20
    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setColor(I)V

    const/high16 v4, 0x41300000    # 11.0f

    .line 21
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    move-result v5

    add-int/lit8 v5, v5, -0x1d

    int-to-float v5, v5

    invoke-virtual {p1, v1, v4, v5, v0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    const v4, -0x77ff78

    .line 22
    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 23
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    move-result v4

    add-int/lit8 v4, v4, -0x1e

    int-to-float v4, v4

    invoke-virtual {p1, v1, v3, v4, v0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 24
    :cond_d6
    iget v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->T:I

    if-le v0, v2, :cond_f4

    .line 25
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->U:Landroidx/constraintlayout/motion/widget/MotionLayout$d;

    if-nez v0, :cond_e5

    .line 26
    new-instance v0, Landroidx/constraintlayout/motion/widget/MotionLayout$d;

    invoke-direct {v0, p0}, Landroidx/constraintlayout/motion/widget/MotionLayout$d;-><init>(Landroidx/constraintlayout/motion/widget/MotionLayout;)V

    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->U:Landroidx/constraintlayout/motion/widget/MotionLayout$d;

    .line 27
    :cond_e5
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->U:Landroidx/constraintlayout/motion/widget/MotionLayout$d;

    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->H:Ljava/util/HashMap;

    iget-object v2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    invoke-virtual {v2}, Lb/f/a/b/q;->d()I

    move-result v2

    iget v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->T:I

    invoke-virtual {v0, p1, v1, v2, v3}, Landroidx/constraintlayout/motion/widget/MotionLayout$d;->a(Landroid/graphics/Canvas;Ljava/util/HashMap;II)V

    :cond_f4
    return-void
.end method

.method public final e()V
    .registers 12

    .line 8
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    const-string v1, "MotionLayout"

    if-nez v0, :cond_c

    const-string v0, "CHECK: motion scene not set! set \"app:layoutDescription=\"@xml/file\""

    .line 9
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 10
    :cond_c
    invoke-virtual {v0}, Lb/f/a/b/q;->k()I

    move-result v0

    iget-object v2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    invoke-virtual {v2}, Lb/f/a/b/q;->k()I

    move-result v3

    invoke-virtual {v2, v3}, Lb/f/a/b/q;->a(I)Lb/f/c/c;

    move-result-object v2

    invoke-virtual {p0, v0, v2}, Landroidx/constraintlayout/motion/widget/MotionLayout;->a(ILb/f/c/c;)V

    .line 11
    new-instance v0, Landroid/util/SparseIntArray;

    invoke-direct {v0}, Landroid/util/SparseIntArray;-><init>()V

    .line 12
    new-instance v2, Landroid/util/SparseIntArray;

    invoke-direct {v2}, Landroid/util/SparseIntArray;-><init>()V

    .line 13
    iget-object v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    invoke-virtual {v3}, Lb/f/a/b/q;->c()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_31
    :goto_31
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_e5

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lb/f/a/b/q$b;

    .line 14
    iget-object v5, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    iget-object v5, v5, Lb/f/a/b/q;->c:Lb/f/a/b/q$b;

    if-ne v4, v5, :cond_48

    const-string v5, "CHECK: CURRENT"

    .line 15
    invoke-static {v1, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 16
    :cond_48
    invoke-virtual {p0, v4}, Landroidx/constraintlayout/motion/widget/MotionLayout;->a(Lb/f/a/b/q$b;)V

    .line 17
    invoke-virtual {v4}, Lb/f/a/b/q$b;->d()I

    move-result v5

    .line 18
    invoke-virtual {v4}, Lb/f/a/b/q$b;->b()I

    move-result v4

    .line 19
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6, v5}, Lb/f/a/b/a;->a(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v6

    .line 20
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-static {v7, v4}, Lb/f/a/b/a;->a(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v7

    .line 21
    invoke-virtual {v0, v5}, Landroid/util/SparseIntArray;->get(I)I

    move-result v8

    const-string v9, "->"

    if-ne v8, v4, :cond_85

    .line 22
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "CHECK: two transitions with the same start and end "

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v1, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    :cond_85
    invoke-virtual {v2, v4}, Landroid/util/SparseIntArray;->get(I)I

    move-result v8

    if-ne v8, v5, :cond_a5

    .line 24
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "CHECK: you can\'t have reverse transitions"

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v1, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    :cond_a5
    invoke-virtual {v0, v5, v4}, Landroid/util/SparseIntArray;->put(II)V

    .line 26
    invoke-virtual {v2, v4, v5}, Landroid/util/SparseIntArray;->put(II)V

    .line 27
    iget-object v7, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    invoke-virtual {v7, v5}, Lb/f/a/b/q;->a(I)Lb/f/c/c;

    move-result-object v5

    if-nez v5, :cond_c7

    .line 28
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, " no such constraintSetStart "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v1, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    :cond_c7
    iget-object v5, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    invoke-virtual {v5, v4}, Lb/f/a/b/q;->a(I)Lb/f/c/c;

    move-result-object v4

    if-nez v4, :cond_31

    .line 30
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, " no such constraintSetEnd "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_31

    :cond_e5
    return-void
.end method

.method public e(I)V
    .registers 3

    .line 3
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->isAttachedToWindow()Z

    move-result v0

    if-nez v0, :cond_17

    .line 4
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C0:Landroidx/constraintlayout/motion/widget/MotionLayout$h;

    if-nez v0, :cond_11

    .line 5
    new-instance v0, Landroidx/constraintlayout/motion/widget/MotionLayout$h;

    invoke-direct {v0, p0}, Landroidx/constraintlayout/motion/widget/MotionLayout$h;-><init>(Landroidx/constraintlayout/motion/widget/MotionLayout;)V

    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C0:Landroidx/constraintlayout/motion/widget/MotionLayout$h;

    .line 6
    :cond_11
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C0:Landroidx/constraintlayout/motion/widget/MotionLayout$h;

    invoke-virtual {v0, p1}, Landroidx/constraintlayout/motion/widget/MotionLayout$h;->a(I)V

    return-void

    :cond_17
    const/4 v0, -0x1

    .line 7
    invoke-virtual {p0, p1, v0, v0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->b(III)V

    return-void
.end method

.method public final f()V
    .registers 5

    .line 3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_5
    if-ge v1, v0, :cond_1c

    .line 4
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 5
    iget-object v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->H:Ljava/util/HashMap;

    invoke-virtual {v3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lb/f/a/b/n;

    if-nez v3, :cond_16

    goto :goto_19

    .line 6
    :cond_16
    invoke-virtual {v3, v2}, Lb/f/a/b/n;->a(Landroid/view/View;)V

    :goto_19
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    :cond_1c
    return-void
.end method

.method public final g()V
    .registers 14

    .line 3
    iget v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->N:F

    iget v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->L:F

    sub-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->signum(F)F

    move-result v0

    .line 4
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->getNanoTime()J

    move-result-wide v1

    .line 5
    iget-object v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->z:Landroid/view/animation/Interpolator;

    instance-of v3, v3, Lb/f/a/a/g;

    const v4, 0x3089705f    # 1.0E-9f

    const/4 v5, 0x0

    if-nez v3, :cond_24

    .line 6
    iget-wide v6, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->M:J

    sub-long v6, v1, v6

    long-to-float v3, v6

    mul-float v3, v3, v0

    mul-float v3, v3, v4

    iget v6, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->J:F

    div-float/2addr v3, v6

    goto :goto_25

    :cond_24
    const/4 v3, 0x0

    .line 7
    :goto_25
    iget v6, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->L:F

    add-float/2addr v6, v3

    .line 8
    iget-boolean v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->O:Z

    if-eqz v3, :cond_2e

    .line 9
    iget v6, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->N:F

    :cond_2e
    const/4 v3, 0x0

    cmpl-float v7, v0, v5

    if-lez v7, :cond_39

    .line 10
    iget v8, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->N:F

    cmpl-float v8, v6, v8

    if-gez v8, :cond_43

    :cond_39
    cmpg-float v8, v0, v5

    if-gtz v8, :cond_47

    iget v8, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->N:F

    cmpg-float v8, v6, v8

    if-gtz v8, :cond_47

    .line 11
    :cond_43
    iget v6, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->N:F

    const/4 v8, 0x1

    goto :goto_48

    :cond_47
    const/4 v8, 0x0

    .line 12
    :goto_48
    iget-object v9, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->z:Landroid/view/animation/Interpolator;

    if-eqz v9, :cond_61

    if-nez v8, :cond_61

    .line 13
    iget-boolean v8, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->V:Z

    if-eqz v8, :cond_5d

    .line 14
    iget-wide v10, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->I:J

    sub-long/2addr v1, v10

    long-to-float v1, v1

    mul-float v1, v1, v4

    .line 15
    invoke-interface {v9, v1}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v6

    goto :goto_61

    .line 16
    :cond_5d
    invoke-interface {v9, v6}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v6

    :cond_61
    :goto_61
    if-lez v7, :cond_69

    .line 17
    iget v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->N:F

    cmpl-float v1, v6, v1

    if-gez v1, :cond_73

    :cond_69
    cmpg-float v0, v0, v5

    if-gtz v0, :cond_75

    iget v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->N:F

    cmpg-float v0, v6, v0

    if-gtz v0, :cond_75

    .line 18
    :cond_73
    iget v6, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->N:F

    .line 19
    :cond_75
    iput v6, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->z0:F

    .line 20
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    .line 21
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->getNanoTime()J

    move-result-wide v1

    :goto_7f
    if-ge v3, v0, :cond_9a

    .line 22
    invoke-virtual {p0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    .line 23
    iget-object v4, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->H:Ljava/util/HashMap;

    invoke-virtual {v4, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    move-object v7, v4

    check-cast v7, Lb/f/a/b/n;

    if-eqz v7, :cond_97

    .line 24
    iget-object v12, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->A0:Lb/f/a/b/e;

    move v9, v6

    move-wide v10, v1

    invoke-virtual/range {v7 .. v12}, Lb/f/a/b/n;->a(Landroid/view/View;FJLb/f/a/b/e;)Z

    :cond_97
    add-int/lit8 v3, v3, 0x1

    goto :goto_7f

    .line 25
    :cond_9a
    iget-boolean v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->s0:Z

    if-eqz v0, :cond_a1

    .line 26
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->requestLayout()V

    :cond_a1
    return-void
.end method

.method public getConstraintSetIds()[I
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    return-object v0

    .line 2
    :cond_6
    invoke-virtual {v0}, Lb/f/a/b/q;->b()[I

    move-result-object v0

    return-object v0
.end method

.method public getCurrentState()I
    .registers 2

    .line 1
    iget v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C:I

    return v0
.end method

.method public getDefinedTransitions()Ljava/util/ArrayList;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lb/f/a/b/q$b;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    return-object v0

    .line 2
    :cond_6
    invoke-virtual {v0}, Lb/f/a/b/q;->c()Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public getDesignTool()Lb/f/a/b/b;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->b0:Lb/f/a/b/b;

    if-nez v0, :cond_b

    .line 2
    new-instance v0, Lb/f/a/b/b;

    invoke-direct {v0, p0}, Lb/f/a/b/b;-><init>(Landroidx/constraintlayout/motion/widget/MotionLayout;)V

    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->b0:Lb/f/a/b/b;

    .line 3
    :cond_b
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->b0:Lb/f/a/b/b;

    return-object v0
.end method

.method public getEndState()I
    .registers 2

    .line 1
    iget v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->D:I

    return v0
.end method

.method public getNanoTime()J
    .registers 3

    .line 1
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    return-wide v0
.end method

.method public getProgress()F
    .registers 2

    .line 1
    iget v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->L:F

    return v0
.end method

.method public getStartState()I
    .registers 2

    .line 1
    iget v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->B:I

    return v0
.end method

.method public getTargetPosition()F
    .registers 2

    .line 1
    iget v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->N:F

    return v0
.end method

.method public getTransitionState()Landroid/os/Bundle;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C0:Landroidx/constraintlayout/motion/widget/MotionLayout$h;

    if-nez v0, :cond_b

    .line 2
    new-instance v0, Landroidx/constraintlayout/motion/widget/MotionLayout$h;

    invoke-direct {v0, p0}, Landroidx/constraintlayout/motion/widget/MotionLayout$h;-><init>(Landroidx/constraintlayout/motion/widget/MotionLayout;)V

    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C0:Landroidx/constraintlayout/motion/widget/MotionLayout$h;

    .line 3
    :cond_b
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C0:Landroidx/constraintlayout/motion/widget/MotionLayout$h;

    invoke-virtual {v0}, Landroidx/constraintlayout/motion/widget/MotionLayout$h;->c()V

    .line 4
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C0:Landroidx/constraintlayout/motion/widget/MotionLayout$h;

    invoke-virtual {v0}, Landroidx/constraintlayout/motion/widget/MotionLayout$h;->b()Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method

.method public getTransitionTimeMs()J
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    const/high16 v1, 0x447a0000    # 1000.0f

    if-eqz v0, :cond_e

    .line 2
    invoke-virtual {v0}, Lb/f/a/b/q;->d()I

    move-result v0

    int-to-float v0, v0

    div-float/2addr v0, v1

    iput v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->J:F

    .line 3
    :cond_e
    iget v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->J:F

    mul-float v0, v0, v1

    float-to-long v0, v0

    return-wide v0
.end method

.method public getVelocity()F
    .registers 2

    .line 1
    iget v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->A:F

    return v0
.end method

.method public final h()V
    .registers 6

    .line 3
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->Q:Landroidx/constraintlayout/motion/widget/MotionLayout$i;

    if-nez v0, :cond_e

    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->m0:Ljava/util/ArrayList;

    if-eqz v0, :cond_71

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_71

    .line 4
    :cond_e
    iget v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->r0:F

    iget v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->K:F

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_71

    .line 5
    iget v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->q0:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_42

    .line 6
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->Q:Landroidx/constraintlayout/motion/widget/MotionLayout$i;

    if-eqz v0, :cond_26

    .line 7
    iget v2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->B:I

    iget v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->D:I

    invoke-interface {v0, p0, v2, v3}, Landroidx/constraintlayout/motion/widget/MotionLayout$i;->a(Landroidx/constraintlayout/motion/widget/MotionLayout;II)V

    .line 8
    :cond_26
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->m0:Ljava/util/ArrayList;

    if-eqz v0, :cond_42

    .line 9
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_42

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/constraintlayout/motion/widget/MotionLayout$i;

    .line 10
    iget v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->B:I

    iget v4, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->D:I

    invoke-interface {v2, p0, v3, v4}, Landroidx/constraintlayout/motion/widget/MotionLayout$i;->a(Landroidx/constraintlayout/motion/widget/MotionLayout;II)V

    goto :goto_2e

    .line 11
    :cond_42
    iput v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->q0:I

    .line 12
    iget v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->K:F

    iput v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->r0:F

    .line 13
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->Q:Landroidx/constraintlayout/motion/widget/MotionLayout$i;

    if-eqz v1, :cond_53

    .line 14
    iget v2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->B:I

    iget v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->D:I

    invoke-interface {v1, p0, v2, v3, v0}, Landroidx/constraintlayout/motion/widget/MotionLayout$i;->a(Landroidx/constraintlayout/motion/widget/MotionLayout;IIF)V

    .line 15
    :cond_53
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->m0:Ljava/util/ArrayList;

    if-eqz v0, :cond_71

    .line 16
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_5b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_71

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/constraintlayout/motion/widget/MotionLayout$i;

    .line 17
    iget v2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->B:I

    iget v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->D:I

    iget v4, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->K:F

    invoke-interface {v1, p0, v2, v3, v4}, Landroidx/constraintlayout/motion/widget/MotionLayout$i;->a(Landroidx/constraintlayout/motion/widget/MotionLayout;IIF)V

    goto :goto_5b

    :cond_71
    return-void
.end method

.method public i()V
    .registers 4

    .line 2
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->Q:Landroidx/constraintlayout/motion/widget/MotionLayout$i;

    if-nez v0, :cond_e

    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->m0:Ljava/util/ArrayList;

    if-eqz v0, :cond_42

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_42

    .line 3
    :cond_e
    iget v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->q0:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_42

    .line 4
    iget v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C:I

    iput v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->q0:I

    .line 5
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->I0:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_32

    .line 6
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->I0:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    goto :goto_33

    :cond_32
    const/4 v0, -0x1

    .line 7
    :goto_33
    iget v2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C:I

    if-eq v0, v2, :cond_42

    if-eq v2, v1, :cond_42

    .line 8
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->I0:Ljava/util/ArrayList;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 9
    :cond_42
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->m()V

    return-void
.end method

.method public isAttachedToWindow()Z
    .registers 3

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_b

    .line 2
    invoke-super {p0}, Landroid/view/ViewGroup;->isAttachedToWindow()Z

    move-result v0

    return v0

    .line 3
    :cond_b
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWindowToken()Landroid/os/IBinder;

    move-result-object v0

    if-eqz v0, :cond_13

    const/4 v0, 0x1

    goto :goto_14

    :cond_13
    const/4 v0, 0x0

    :goto_14
    return v0
.end method

.method public j()Z
    .registers 2

    .line 2
    iget-boolean v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->G:Z

    return v0
.end method

.method public k()Landroidx/constraintlayout/motion/widget/MotionLayout$f;
    .registers 2

    .line 2
    invoke-static {}, Landroidx/constraintlayout/motion/widget/MotionLayout$g;->d()Landroidx/constraintlayout/motion/widget/MotionLayout$g;

    move-result-object v0

    return-object v0
.end method

.method public final l()V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    if-nez v0, :cond_5

    return-void

    .line 2
    :cond_5
    iget v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C:I

    invoke-virtual {v0, p0, v1}, Lb/f/a/b/q;->b(Landroidx/constraintlayout/motion/widget/MotionLayout;I)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 3
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->requestLayout()V

    return-void

    .line 4
    :cond_11
    iget v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_1b

    .line 5
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    invoke-virtual {v1, p0, v0}, Lb/f/a/b/q;->a(Landroidx/constraintlayout/motion/widget/MotionLayout;I)V

    .line 6
    :cond_1b
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    invoke-virtual {v0}, Lb/f/a/b/q;->n()Z

    move-result v0

    if-eqz v0, :cond_28

    .line 7
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    invoke-virtual {v0}, Lb/f/a/b/q;->m()V

    :cond_28
    return-void
.end method

.method public final m()V
    .registers 6

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->Q:Landroidx/constraintlayout/motion/widget/MotionLayout$i;

    if-nez v0, :cond_f

    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->m0:Ljava/util/ArrayList;

    if-eqz v0, :cond_e

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_f

    :cond_e
    return-void

    .line 2
    :cond_f
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->I0:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_15
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_48

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 3
    iget-object v2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->Q:Landroidx/constraintlayout/motion/widget/MotionLayout$i;

    if-eqz v2, :cond_2c

    .line 4
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-interface {v2, p0, v3}, Landroidx/constraintlayout/motion/widget/MotionLayout$i;->a(Landroidx/constraintlayout/motion/widget/MotionLayout;I)V

    .line 5
    :cond_2c
    iget-object v2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->m0:Ljava/util/ArrayList;

    if-eqz v2, :cond_15

    .line 6
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_34
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_15

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/constraintlayout/motion/widget/MotionLayout$i;

    .line 7
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-interface {v3, p0, v4}, Landroidx/constraintlayout/motion/widget/MotionLayout$i;->a(Landroidx/constraintlayout/motion/widget/MotionLayout;I)V

    goto :goto_34

    .line 8
    :cond_48
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->I0:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    return-void
.end method

.method public n()V
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->E0:Landroidx/constraintlayout/motion/widget/MotionLayout$e;

    invoke-virtual {v0}, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->b()V

    .line 2
    invoke-virtual {p0}, Landroid/view/ViewGroup;->invalidate()V

    return-void
.end method

.method public final o()V
    .registers 13

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    .line 2
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->E0:Landroidx/constraintlayout/motion/widget/MotionLayout$e;

    invoke-virtual {v1}, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->a()V

    const/4 v1, 0x1

    .line 3
    iput-boolean v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->P:Z

    .line 4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    move-result v8

    .line 5
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    move-result v9

    .line 6
    iget-object v2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    invoke-virtual {v2}, Lb/f/a/b/q;->a()I

    move-result v2

    const/4 v10, 0x0

    const/4 v3, -0x1

    if-eq v2, v3, :cond_35

    const/4 v3, 0x0

    :goto_1f
    if-ge v3, v0, :cond_35

    .line 7
    iget-object v4, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->H:Ljava/util/HashMap;

    invoke-virtual {p0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lb/f/a/b/n;

    if-eqz v4, :cond_32

    .line 8
    invoke-virtual {v4, v2}, Lb/f/a/b/n;->b(I)V

    :cond_32
    add-int/lit8 v3, v3, 0x1

    goto :goto_1f

    :cond_35
    const/4 v11, 0x0

    :goto_36
    if-ge v11, v0, :cond_59

    .line 9
    iget-object v2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->H:Ljava/util/HashMap;

    invoke-virtual {p0, v11}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/f/a/b/n;

    if-eqz v2, :cond_56

    .line 10
    iget-object v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    invoke-virtual {v3, v2}, Lb/f/a/b/q;->a(Lb/f/a/b/n;)V

    .line 11
    iget v5, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->J:F

    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->getNanoTime()J

    move-result-wide v6

    move v3, v8

    move v4, v9

    invoke-virtual/range {v2 .. v7}, Lb/f/a/b/n;->a(IIFJ)V

    :cond_56
    add-int/lit8 v11, v11, 0x1

    goto :goto_36

    .line 12
    :cond_59
    iget-object v2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    invoke-virtual {v2}, Lb/f/a/b/q;->j()F

    move-result v2

    const/4 v3, 0x0

    cmpl-float v3, v2, v3

    if-eqz v3, :cond_142

    float-to-double v3, v2

    const-wide/16 v5, 0x0

    cmpg-double v7, v3, v5

    if-gez v7, :cond_6d

    const/4 v3, 0x1

    goto :goto_6e

    :cond_6d
    const/4 v3, 0x0

    .line 13
    :goto_6e
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    const v4, -0x800001

    const v5, 0x7f7fffff    # Float.MAX_VALUE

    const/4 v6, 0x0

    const v7, 0x7f7fffff    # Float.MAX_VALUE

    const v8, -0x800001

    :goto_7f
    if-ge v6, v0, :cond_ae

    .line 14
    iget-object v9, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->H:Ljava/util/HashMap;

    invoke-virtual {p0, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v11

    invoke-virtual {v9, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lb/f/a/b/n;

    .line 15
    iget v11, v9, Lb/f/a/b/n;->j:F

    invoke-static {v11}, Ljava/lang/Float;->isNaN(F)Z

    move-result v11

    if-nez v11, :cond_96

    goto :goto_af

    .line 16
    :cond_96
    invoke-virtual {v9}, Lb/f/a/b/n;->b()F

    move-result v11

    .line 17
    invoke-virtual {v9}, Lb/f/a/b/n;->c()F

    move-result v9

    if-eqz v3, :cond_a2

    sub-float/2addr v9, v11

    goto :goto_a3

    :cond_a2
    add-float/2addr v9, v11

    .line 18
    :goto_a3
    invoke-static {v7, v9}, Ljava/lang/Math;->min(FF)F

    move-result v7

    .line 19
    invoke-static {v8, v9}, Ljava/lang/Math;->max(FF)F

    move-result v8

    add-int/lit8 v6, v6, 0x1

    goto :goto_7f

    :cond_ae
    const/4 v1, 0x0

    :goto_af
    const/high16 v6, 0x3f800000    # 1.0f

    if-eqz v1, :cond_114

    const/4 v1, 0x0

    :goto_b4
    if-ge v1, v0, :cond_d9

    .line 20
    iget-object v7, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->H:Ljava/util/HashMap;

    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lb/f/a/b/n;

    .line 21
    iget v8, v7, Lb/f/a/b/n;->j:F

    invoke-static {v8}, Ljava/lang/Float;->isNaN(F)Z

    move-result v8

    if-nez v8, :cond_d6

    .line 22
    iget v8, v7, Lb/f/a/b/n;->j:F

    invoke-static {v5, v8}, Ljava/lang/Math;->min(FF)F

    move-result v5

    .line 23
    iget v7, v7, Lb/f/a/b/n;->j:F

    invoke-static {v4, v7}, Ljava/lang/Math;->max(FF)F

    move-result v4

    :cond_d6
    add-int/lit8 v1, v1, 0x1

    goto :goto_b4

    :cond_d9
    :goto_d9
    if-ge v10, v0, :cond_142

    .line 24
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->H:Ljava/util/HashMap;

    invoke-virtual {p0, v10}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    invoke-virtual {v1, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/f/a/b/n;

    .line 25
    iget v7, v1, Lb/f/a/b/n;->j:F

    invoke-static {v7}, Ljava/lang/Float;->isNaN(F)Z

    move-result v7

    if-nez v7, :cond_111

    sub-float v7, v6, v2

    div-float v7, v6, v7

    .line 26
    iput v7, v1, Lb/f/a/b/n;->l:F

    if-eqz v3, :cond_105

    .line 27
    iget v7, v1, Lb/f/a/b/n;->j:F

    sub-float v7, v4, v7

    sub-float v8, v4, v5

    div-float/2addr v7, v8

    mul-float v7, v7, v2

    sub-float v7, v2, v7

    iput v7, v1, Lb/f/a/b/n;->k:F

    goto :goto_111

    .line 28
    :cond_105
    iget v7, v1, Lb/f/a/b/n;->j:F

    sub-float/2addr v7, v5

    mul-float v7, v7, v2

    sub-float v8, v4, v5

    div-float/2addr v7, v8

    sub-float v7, v2, v7

    iput v7, v1, Lb/f/a/b/n;->k:F

    :cond_111
    :goto_111
    add-int/lit8 v10, v10, 0x1

    goto :goto_d9

    :cond_114
    :goto_114
    if-ge v10, v0, :cond_142

    .line 29
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->H:Ljava/util/HashMap;

    invoke-virtual {p0, v10}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/f/a/b/n;

    .line 30
    invoke-virtual {v1}, Lb/f/a/b/n;->b()F

    move-result v4

    .line 31
    invoke-virtual {v1}, Lb/f/a/b/n;->c()F

    move-result v5

    if-eqz v3, :cond_12e

    sub-float/2addr v5, v4

    goto :goto_12f

    :cond_12e
    add-float/2addr v5, v4

    :goto_12f
    sub-float v4, v6, v2

    div-float v4, v6, v4

    .line 32
    iput v4, v1, Lb/f/a/b/n;->l:F

    sub-float/2addr v5, v7

    mul-float v5, v5, v2

    sub-float v4, v8, v7

    div-float/2addr v5, v4

    sub-float v4, v2, v5

    .line 33
    iput v4, v1, Lb/f/a/b/n;->k:F

    add-int/lit8 v10, v10, 0x1

    goto :goto_114

    :cond_142
    return-void
.end method

.method public onAttachedToWindow()V
    .registers 4

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onAttachedToWindow()V

    .line 2
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    if-eqz v0, :cond_1e

    iget v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_1e

    .line 3
    invoke-virtual {v0, v1}, Lb/f/a/b/q;->a(I)Lb/f/c/c;

    move-result-object v0

    .line 4
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    invoke-virtual {v1, p0}, Lb/f/a/b/q;->a(Landroidx/constraintlayout/motion/widget/MotionLayout;)V

    if-eqz v0, :cond_1a

    .line 5
    invoke-virtual {v0, p0}, Lb/f/c/c;->b(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    .line 6
    :cond_1a
    iget v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C:I

    iput v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->B:I

    .line 7
    :cond_1e
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->l()V

    .line 8
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C0:Landroidx/constraintlayout/motion/widget/MotionLayout$h;

    if-eqz v0, :cond_28

    .line 9
    invoke-virtual {v0}, Landroidx/constraintlayout/motion/widget/MotionLayout$h;->a()V

    :cond_28
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 8

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    const/4 v1, 0x0

    if-eqz v0, :cond_93

    iget-boolean v2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->G:Z

    if-nez v2, :cond_b

    goto/16 :goto_93

    .line 2
    :cond_b
    iget-object v0, v0, Lb/f/a/b/q;->c:Lb/f/a/b/q$b;

    if-eqz v0, :cond_93

    .line 3
    invoke-virtual {v0}, Lb/f/a/b/q$b;->f()Z

    move-result v2

    if-eqz v2, :cond_93

    .line 4
    invoke-virtual {v0}, Lb/f/a/b/q$b;->e()Lb/f/a/b/t;

    move-result-object v0

    if-eqz v0, :cond_93

    .line 5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v2

    if-nez v2, :cond_3b

    .line 6
    new-instance v2, Landroid/graphics/RectF;

    invoke-direct {v2}, Landroid/graphics/RectF;-><init>()V

    invoke-virtual {v0, p0, v2}, Lb/f/a/b/t;->b(Landroid/view/ViewGroup;Landroid/graphics/RectF;)Landroid/graphics/RectF;

    move-result-object v2

    if-eqz v2, :cond_3b

    .line 7
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    invoke-virtual {v2, v3, v4}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v2

    if-nez v2, :cond_3b

    return v1

    .line 8
    :cond_3b
    invoke-virtual {v0}, Lb/f/a/b/t;->e()I

    move-result v0

    const/4 v2, -0x1

    if-eq v0, v2, :cond_93

    .line 9
    iget-object v2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->H0:Landroid/view/View;

    if-eqz v2, :cond_4c

    invoke-virtual {v2}, Landroid/view/View;->getId()I

    move-result v2

    if-eq v2, v0, :cond_52

    .line 10
    :cond_4c
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->H0:Landroid/view/View;

    .line 11
    :cond_52
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->H0:Landroid/view/View;

    if-eqz v0, :cond_93

    .line 12
    iget-object v2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->G0:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v0

    int-to-float v0, v0

    iget-object v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->H0:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getTop()I

    move-result v3

    int-to-float v3, v3

    iget-object v4, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->H0:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getRight()I

    move-result v4

    int-to-float v4, v4

    iget-object v5, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->H0:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getBottom()I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {v2, v0, v3, v4, v5}, Landroid/graphics/RectF;->set(FFFF)V

    .line 13
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->G0:Landroid/graphics/RectF;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    invoke-virtual {v0, v2, v3}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v0

    if-eqz v0, :cond_93

    .line 14
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->H0:Landroid/view/View;

    const/4 v2, 0x0

    invoke-virtual {p0, v2, v2, v0, p1}, Landroidx/constraintlayout/motion/widget/MotionLayout;->a(FFLandroid/view/View;Landroid/view/MotionEvent;)Z

    move-result v0

    if-nez v0, :cond_93

    .line 15
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/motion/widget/MotionLayout;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1

    :cond_93
    :goto_93
    return v1
.end method

.method public onLayout(ZIIII)V
    .registers 9

    const/4 v0, 0x1

    .line 1
    iput-boolean v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->B0:Z

    const/4 v1, 0x0

    .line 2
    :try_start_4
    iget-object v2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    if-nez v2, :cond_e

    .line 3
    invoke-super/range {p0 .. p5}, Landroidx/constraintlayout/widget/ConstraintLayout;->onLayout(ZIIII)V
    :try_end_b
    .catchall {:try_start_4 .. :try_end_b} :catchall_25

    .line 4
    iput-boolean v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->B0:Z

    return-void

    :cond_e
    sub-int/2addr p4, p2

    sub-int/2addr p5, p3

    .line 5
    :try_start_10
    iget p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->c0:I

    if-ne p1, p4, :cond_18

    iget p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->d0:I

    if-eq p1, p5, :cond_1e

    .line 6
    :cond_18
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->n()V

    .line 7
    invoke-virtual {p0, v0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->a(Z)V

    .line 8
    :cond_1e
    iput p4, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->c0:I

    .line 9
    iput p5, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->d0:I
    :try_end_22
    .catchall {:try_start_10 .. :try_end_22} :catchall_25

    .line 10
    iput-boolean v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->B0:Z

    return-void

    :catchall_25
    move-exception p1

    iput-boolean v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->B0:Z

    .line 11
    throw p1
.end method

.method public onMeasure(II)V
    .registers 9

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    if-nez v0, :cond_8

    .line 2
    invoke-super {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;->onMeasure(II)V

    return-void

    .line 3
    :cond_8
    iget v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->E:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v0, p1, :cond_15

    iget v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->F:I

    if-eq v0, p2, :cond_13

    goto :goto_15

    :cond_13
    const/4 v0, 0x0

    goto :goto_16

    :cond_15
    :goto_15
    const/4 v0, 0x1

    .line 4
    :goto_16
    iget-boolean v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->F0:Z

    if-eqz v3, :cond_23

    .line 5
    iput-boolean v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->F0:Z

    .line 6
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->l()V

    .line 7
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->m()V

    const/4 v0, 0x1

    .line 8
    :cond_23
    iget-boolean v3, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->o:Z

    if-eqz v3, :cond_28

    const/4 v0, 0x1

    .line 9
    :cond_28
    iput p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->E:I

    .line 10
    iput p2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->F:I

    .line 11
    iget-object v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    invoke-virtual {v3}, Lb/f/a/b/q;->k()I

    move-result v3

    .line 12
    iget-object v4, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    invoke-virtual {v4}, Lb/f/a/b/q;->e()I

    move-result v4

    if-nez v0, :cond_42

    .line 13
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->E0:Landroidx/constraintlayout/motion/widget/MotionLayout$e;

    invoke-virtual {v0, v3, v4}, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->a(II)Z

    move-result v0

    if-eqz v0, :cond_68

    :cond_42
    iget v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->B:I

    const/4 v5, -0x1

    if-eq v0, v5, :cond_68

    .line 14
    invoke-super {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;->onMeasure(II)V

    .line 15
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->E0:Landroidx/constraintlayout/motion/widget/MotionLayout$e;

    iget-object p2, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->j:Lb/f/b/k/f;

    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    invoke-virtual {v0, v3}, Lb/f/a/b/q;->a(I)Lb/f/c/c;

    move-result-object v0

    iget-object v2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    invoke-virtual {v2, v4}, Lb/f/a/b/q;->a(I)Lb/f/c/c;

    move-result-object v2

    invoke-virtual {p1, p2, v0, v2}, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->a(Lb/f/b/k/f;Lb/f/c/c;Lb/f/c/c;)V

    .line 16
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->E0:Landroidx/constraintlayout/motion/widget/MotionLayout$e;

    invoke-virtual {p1}, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->b()V

    .line 17
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->E0:Landroidx/constraintlayout/motion/widget/MotionLayout$e;

    invoke-virtual {p1, v3, v4}, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->c(II)V

    goto :goto_69

    :cond_68
    const/4 v1, 0x1

    .line 18
    :goto_69
    iget-boolean p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->s0:Z

    if-nez p1, :cond_6f

    if-eqz v1, :cond_c0

    .line 19
    :cond_6f
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    move-result p1

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    move-result p2

    add-int/2addr p1, p2

    .line 20
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    move-result p2

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    move-result v0

    add-int/2addr p2, v0

    .line 21
    iget-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->j:Lb/f/b/k/f;

    invoke-virtual {v0}, Lb/f/b/k/e;->A()I

    move-result v0

    add-int/2addr v0, p2

    .line 22
    iget-object p2, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->j:Lb/f/b/k/f;

    invoke-virtual {p2}, Lb/f/b/k/e;->k()I

    move-result p2

    add-int/2addr p2, p1

    .line 23
    iget p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->x0:I

    const/high16 v1, -0x80000000

    if-eq p1, v1, :cond_97

    if-nez p1, :cond_a7

    .line 24
    :cond_97
    iget p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->t0:I

    int-to-float v0, p1

    iget v2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->z0:F

    iget v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->v0:I

    sub-int/2addr v3, p1

    int-to-float p1, v3

    mul-float v2, v2, p1

    add-float/2addr v0, v2

    float-to-int v0, v0

    .line 25
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->requestLayout()V

    .line 26
    :cond_a7
    iget p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y0:I

    if-eq p1, v1, :cond_ad

    if-nez p1, :cond_bd

    .line 27
    :cond_ad
    iget p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->u0:I

    int-to-float p2, p1

    iget v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->z0:F

    iget v2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->w0:I

    sub-int/2addr v2, p1

    int-to-float p1, v2

    mul-float v1, v1, p1

    add-float/2addr p2, v1

    float-to-int p2, p2

    .line 28
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->requestLayout()V

    .line 29
    :cond_bd
    invoke-virtual {p0, v0, p2}, Landroid/view/ViewGroup;->setMeasuredDimension(II)V

    .line 30
    :cond_c0
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->g()V

    return-void
.end method

.method public onNestedFling(Landroid/view/View;FFZ)Z
    .registers 5

    const/4 p1, 0x0

    return p1
.end method

.method public onNestedPreFling(Landroid/view/View;FF)Z
    .registers 4

    const/4 p1, 0x0

    return p1
.end method

.method public onRtlPropertiesChanged(I)V
    .registers 3

    .line 1
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    if-eqz p1, :cond_b

    .line 2
    invoke-virtual {p0}, Landroidx/constraintlayout/widget/ConstraintLayout;->a()Z

    move-result v0

    invoke-virtual {p1, v0}, Lb/f/a/b/q;->a(Z)V

    :cond_b
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 4

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    if-eqz v0, :cond_2a

    iget-boolean v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->G:Z

    if-eqz v1, :cond_2a

    invoke-virtual {v0}, Lb/f/a/b/q;->n()Z

    move-result v0

    if-eqz v0, :cond_2a

    .line 2
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    iget-object v0, v0, Lb/f/a/b/q;->c:Lb/f/a/b/q$b;

    if-eqz v0, :cond_1f

    .line 3
    invoke-virtual {v0}, Lb/f/a/b/q$b;->f()Z

    move-result v0

    if-nez v0, :cond_1f

    .line 4
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1

    .line 5
    :cond_1f
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->getCurrentState()I

    move-result v1

    invoke-virtual {v0, p1, v1, p0}, Lb/f/a/b/q;->a(Landroid/view/MotionEvent;ILandroidx/constraintlayout/motion/widget/MotionLayout;)V

    const/4 p1, 0x1

    return p1

    .line 6
    :cond_2a
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public onViewAdded(Landroid/view/View;)V
    .registers 3

    .line 1
    invoke-super {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;->onViewAdded(Landroid/view/View;)V

    .line 2
    instance-of v0, p1, Landroidx/constraintlayout/motion/widget/MotionHelper;

    if-eqz v0, :cond_45

    .line 3
    check-cast p1, Landroidx/constraintlayout/motion/widget/MotionHelper;

    .line 4
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->m0:Ljava/util/ArrayList;

    if-nez v0, :cond_14

    .line 5
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->m0:Ljava/util/ArrayList;

    .line 6
    :cond_14
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->m0:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 7
    invoke-virtual {p1}, Landroidx/constraintlayout/motion/widget/MotionHelper;->d()Z

    move-result v0

    if-eqz v0, :cond_2f

    .line 8
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->k0:Ljava/util/ArrayList;

    if-nez v0, :cond_2a

    .line 9
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->k0:Ljava/util/ArrayList;

    .line 10
    :cond_2a
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->k0:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 11
    :cond_2f
    invoke-virtual {p1}, Landroidx/constraintlayout/motion/widget/MotionHelper;->c()Z

    move-result v0

    if-eqz v0, :cond_45

    .line 12
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->l0:Ljava/util/ArrayList;

    if-nez v0, :cond_40

    .line 13
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->l0:Ljava/util/ArrayList;

    .line 14
    :cond_40
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->l0:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_45
    return-void
.end method

.method public onViewRemoved(Landroid/view/View;)V
    .registers 3

    .line 1
    invoke-super {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;->onViewRemoved(Landroid/view/View;)V

    .line 2
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->k0:Ljava/util/ArrayList;

    if-eqz v0, :cond_a

    .line 3
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 4
    :cond_a
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->l0:Ljava/util/ArrayList;

    if-eqz v0, :cond_11

    .line 5
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    :cond_11
    return-void
.end method

.method public p()V
    .registers 2

    const/high16 v0, 0x3f800000    # 1.0f

    .line 1
    invoke-virtual {p0, v0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->a(F)V

    return-void
.end method

.method public q()V
    .registers 2

    const/4 v0, 0x0

    .line 1
    invoke-virtual {p0, v0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->a(F)V

    return-void
.end method

.method public requestLayout()V
    .registers 3

    .line 1
    iget-boolean v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->s0:Z

    if-nez v0, :cond_18

    .line 2
    iget v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_18

    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    if-eqz v0, :cond_18

    iget-object v0, v0, Lb/f/a/b/q;->c:Lb/f/a/b/q$b;

    if-eqz v0, :cond_18

    .line 3
    invoke-virtual {v0}, Lb/f/a/b/q$b;->c()I

    move-result v0

    if-nez v0, :cond_18

    return-void

    .line 4
    :cond_18
    invoke-super {p0}, Landroidx/constraintlayout/widget/ConstraintLayout;->requestLayout()V

    return-void
.end method

.method public setDebugMode(I)V
    .registers 2

    .line 1
    iput p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->T:I

    .line 2
    invoke-virtual {p0}, Landroid/view/ViewGroup;->invalidate()V

    return-void
.end method

.method public setInteractionEnabled(Z)V
    .registers 2

    .line 1
    iput-boolean p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->G:Z

    return-void
.end method

.method public setInterpolatedProgress(F)V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    if-eqz v0, :cond_19

    .line 2
    sget-object v0, Landroidx/constraintlayout/motion/widget/MotionLayout$j;->MOVING:Landroidx/constraintlayout/motion/widget/MotionLayout$j;

    invoke-virtual {p0, v0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->setState(Landroidx/constraintlayout/motion/widget/MotionLayout$j;)V

    .line 3
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    invoke-virtual {v0}, Lb/f/a/b/q;->f()Landroid/view/animation/Interpolator;

    move-result-object v0

    if-eqz v0, :cond_19

    .line 4
    invoke-interface {v0, p1}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result p1

    invoke-virtual {p0, p1}, Landroidx/constraintlayout/motion/widget/MotionLayout;->setProgress(F)V

    return-void

    .line 5
    :cond_19
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/motion/widget/MotionLayout;->setProgress(F)V

    return-void
.end method

.method public setOnHide(F)V
    .registers 5

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->l0:Ljava/util/ArrayList;

    if-eqz v0, :cond_19

    .line 2
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_9
    if-ge v1, v0, :cond_19

    .line 3
    iget-object v2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->l0:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/constraintlayout/motion/widget/MotionHelper;

    .line 4
    invoke-virtual {v2, p1}, Landroidx/constraintlayout/motion/widget/MotionHelper;->setProgress(F)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_9

    :cond_19
    return-void
.end method

.method public setOnShow(F)V
    .registers 5

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->k0:Ljava/util/ArrayList;

    if-eqz v0, :cond_19

    .line 2
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_9
    if-ge v1, v0, :cond_19

    .line 3
    iget-object v2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->k0:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/constraintlayout/motion/widget/MotionHelper;

    .line 4
    invoke-virtual {v2, p1}, Landroidx/constraintlayout/motion/widget/MotionHelper;->setProgress(F)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_9

    :cond_19
    return-void
.end method

.method public setProgress(F)V
    .registers 5

    .line 1
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->isAttachedToWindow()Z

    move-result v0

    if-nez v0, :cond_17

    .line 2
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C0:Landroidx/constraintlayout/motion/widget/MotionLayout$h;

    if-nez v0, :cond_11

    .line 3
    new-instance v0, Landroidx/constraintlayout/motion/widget/MotionLayout$h;

    invoke-direct {v0, p0}, Landroidx/constraintlayout/motion/widget/MotionLayout$h;-><init>(Landroidx/constraintlayout/motion/widget/MotionLayout;)V

    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C0:Landroidx/constraintlayout/motion/widget/MotionLayout$h;

    .line 4
    :cond_11
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C0:Landroidx/constraintlayout/motion/widget/MotionLayout$h;

    invoke-virtual {v0, p1}, Landroidx/constraintlayout/motion/widget/MotionLayout$h;->a(F)V

    return-void

    :cond_17
    const/4 v0, 0x0

    cmpg-float v1, p1, v0

    if-gtz v1, :cond_2c

    .line 5
    iget v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->B:I

    iput v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C:I

    .line 6
    iget v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->L:F

    cmpl-float v0, v1, v0

    if-nez v0, :cond_4a

    .line 7
    sget-object v0, Landroidx/constraintlayout/motion/widget/MotionLayout$j;->FINISHED:Landroidx/constraintlayout/motion/widget/MotionLayout$j;

    invoke-virtual {p0, v0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->setState(Landroidx/constraintlayout/motion/widget/MotionLayout$j;)V

    goto :goto_4a

    :cond_2c
    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float v1, p1, v0

    if-ltz v1, :cond_42

    .line 8
    iget v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->D:I

    iput v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C:I

    .line 9
    iget v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->L:F

    cmpl-float v0, v1, v0

    if-nez v0, :cond_4a

    .line 10
    sget-object v0, Landroidx/constraintlayout/motion/widget/MotionLayout$j;->FINISHED:Landroidx/constraintlayout/motion/widget/MotionLayout$j;

    invoke-virtual {p0, v0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->setState(Landroidx/constraintlayout/motion/widget/MotionLayout$j;)V

    goto :goto_4a

    :cond_42
    const/4 v0, -0x1

    .line 11
    iput v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C:I

    .line 12
    sget-object v0, Landroidx/constraintlayout/motion/widget/MotionLayout$j;->MOVING:Landroidx/constraintlayout/motion/widget/MotionLayout$j;

    invoke-virtual {p0, v0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->setState(Landroidx/constraintlayout/motion/widget/MotionLayout$j;)V

    .line 13
    :cond_4a
    :goto_4a
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    if-nez v0, :cond_4f

    return-void

    :cond_4f
    const/4 v0, 0x1

    .line 14
    iput-boolean v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->O:Z

    .line 15
    iput p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->N:F

    .line 16
    iput p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->K:F

    const-wide/16 v1, -0x1

    .line 17
    iput-wide v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->M:J

    .line 18
    iput-wide v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->I:J

    const/4 p1, 0x0

    .line 19
    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->z:Landroid/view/animation/Interpolator;

    .line 20
    iput-boolean v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->P:Z

    .line 21
    invoke-virtual {p0}, Landroid/view/ViewGroup;->invalidate()V

    return-void
.end method

.method public setScene(Lb/f/a/b/q;)V
    .registers 3

    .line 1
    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    .line 2
    invoke-virtual {p0}, Landroidx/constraintlayout/widget/ConstraintLayout;->a()Z

    move-result v0

    invoke-virtual {p1, v0}, Lb/f/a/b/q;->a(Z)V

    .line 3
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->n()V

    return-void
.end method

.method public setState(Landroidx/constraintlayout/motion/widget/MotionLayout$j;)V
    .registers 4

    .line 1
    sget-object v0, Landroidx/constraintlayout/motion/widget/MotionLayout$j;->FINISHED:Landroidx/constraintlayout/motion/widget/MotionLayout$j;

    if-ne p1, v0, :cond_a

    iget v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_a

    return-void

    .line 2
    :cond_a
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->D0:Landroidx/constraintlayout/motion/widget/MotionLayout$j;

    .line 3
    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->D0:Landroidx/constraintlayout/motion/widget/MotionLayout$j;

    .line 4
    sget-object v1, Landroidx/constraintlayout/motion/widget/MotionLayout$j;->MOVING:Landroidx/constraintlayout/motion/widget/MotionLayout$j;

    if-ne v0, v1, :cond_17

    if-ne p1, v1, :cond_17

    .line 5
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->h()V

    .line 6
    :cond_17
    sget-object v1, Landroidx/constraintlayout/motion/widget/MotionLayout$b;->a:[I

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    aget v0, v1, v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_31

    const/4 v1, 0x2

    if-eq v0, v1, :cond_31

    const/4 v1, 0x3

    if-eq v0, v1, :cond_29

    goto :goto_3f

    .line 7
    :cond_29
    sget-object v0, Landroidx/constraintlayout/motion/widget/MotionLayout$j;->FINISHED:Landroidx/constraintlayout/motion/widget/MotionLayout$j;

    if-ne p1, v0, :cond_3f

    .line 8
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->i()V

    goto :goto_3f

    .line 9
    :cond_31
    sget-object v0, Landroidx/constraintlayout/motion/widget/MotionLayout$j;->MOVING:Landroidx/constraintlayout/motion/widget/MotionLayout$j;

    if-ne p1, v0, :cond_38

    .line 10
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->h()V

    .line 11
    :cond_38
    sget-object v0, Landroidx/constraintlayout/motion/widget/MotionLayout$j;->FINISHED:Landroidx/constraintlayout/motion/widget/MotionLayout$j;

    if-ne p1, v0, :cond_3f

    .line 12
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->i()V

    :cond_3f
    :goto_3f
    return-void
.end method

.method public setTransition(I)V
    .registers 8

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    if-eqz v0, :cond_95

    .line 2
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/motion/widget/MotionLayout;->d(I)Lb/f/a/b/q$b;

    move-result-object p1

    .line 3
    invoke-virtual {p1}, Lb/f/a/b/q$b;->d()I

    move-result v0

    iput v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->B:I

    .line 4
    invoke-virtual {p1}, Lb/f/a/b/q$b;->b()I

    move-result v0

    iput v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->D:I

    .line 5
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->isAttachedToWindow()Z

    move-result v0

    if-nez v0, :cond_34

    .line 6
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C0:Landroidx/constraintlayout/motion/widget/MotionLayout$h;

    if-nez p1, :cond_25

    .line 7
    new-instance p1, Landroidx/constraintlayout/motion/widget/MotionLayout$h;

    invoke-direct {p1, p0}, Landroidx/constraintlayout/motion/widget/MotionLayout$h;-><init>(Landroidx/constraintlayout/motion/widget/MotionLayout;)V

    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C0:Landroidx/constraintlayout/motion/widget/MotionLayout$h;

    .line 8
    :cond_25
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C0:Landroidx/constraintlayout/motion/widget/MotionLayout$h;

    iget v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->B:I

    invoke-virtual {p1, v0}, Landroidx/constraintlayout/motion/widget/MotionLayout$h;->b(I)V

    .line 9
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C0:Landroidx/constraintlayout/motion/widget/MotionLayout$h;

    iget v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->D:I

    invoke-virtual {p1, v0}, Landroidx/constraintlayout/motion/widget/MotionLayout$h;->a(I)V

    return-void

    :cond_34
    const/high16 v0, 0x7fc00000    # Float.NaN

    .line 10
    iget v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C:I

    iget v2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->B:I

    const/4 v3, 0x0

    if-ne v1, v2, :cond_3f

    const/4 v0, 0x0

    goto :goto_45

    .line 11
    :cond_3f
    iget v2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->D:I

    if-ne v1, v2, :cond_45

    const/high16 v0, 0x3f800000    # 1.0f

    .line 12
    :cond_45
    :goto_45
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    invoke-virtual {v1, p1}, Lb/f/a/b/q;->a(Lb/f/a/b/q$b;)V

    .line 13
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->E0:Landroidx/constraintlayout/motion/widget/MotionLayout$e;

    iget-object v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->j:Lb/f/b/k/f;

    iget-object v2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    iget v4, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->B:I

    invoke-virtual {v2, v4}, Lb/f/a/b/q;->a(I)Lb/f/c/c;

    move-result-object v2

    iget-object v4, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    iget v5, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->D:I

    invoke-virtual {v4, v5}, Lb/f/a/b/q;->a(I)Lb/f/c/c;

    move-result-object v4

    invoke-virtual {p1, v1, v2, v4}, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->a(Lb/f/b/k/f;Lb/f/c/c;Lb/f/c/c;)V

    .line 14
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->n()V

    .line 15
    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result p1

    if-eqz p1, :cond_6b

    goto :goto_6c

    :cond_6b
    move v3, v0

    :goto_6c
    iput v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->L:F

    .line 16
    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result p1

    if-eqz p1, :cond_92

    .line 17
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lb/f/a/b/a;->a()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " transitionToStart "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "MotionLayout"

    invoke-static {v0, p1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->q()V

    goto :goto_95

    .line 19
    :cond_92
    invoke-virtual {p0, v0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->setProgress(F)V

    :cond_95
    :goto_95
    return-void
.end method

.method public setTransition(Lb/f/a/b/q$b;)V
    .registers 6

    .line 20
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    invoke-virtual {v0, p1}, Lb/f/a/b/q;->a(Lb/f/a/b/q$b;)V

    .line 21
    sget-object v0, Landroidx/constraintlayout/motion/widget/MotionLayout$j;->SETUP:Landroidx/constraintlayout/motion/widget/MotionLayout$j;

    invoke-virtual {p0, v0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->setState(Landroidx/constraintlayout/motion/widget/MotionLayout$j;)V

    .line 22
    iget v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C:I

    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    invoke-virtual {v1}, Lb/f/a/b/q;->e()I

    move-result v1

    if-ne v0, v1, :cond_1d

    const/high16 v0, 0x3f800000    # 1.0f

    .line 23
    iput v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->L:F

    .line 24
    iput v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->K:F

    .line 25
    iput v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->N:F

    goto :goto_24

    :cond_1d
    const/4 v0, 0x0

    .line 26
    iput v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->L:F

    .line 27
    iput v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->K:F

    .line 28
    iput v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->N:F

    :goto_24
    const/4 v0, 0x1

    .line 29
    invoke-virtual {p1, v0}, Lb/f/a/b/q$b;->a(I)Z

    move-result p1

    if-eqz p1, :cond_2e

    const-wide/16 v0, -0x1

    goto :goto_32

    :cond_2e
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->getNanoTime()J

    move-result-wide v0

    :goto_32
    iput-wide v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->M:J

    .line 30
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    invoke-virtual {p1}, Lb/f/a/b/q;->k()I

    move-result p1

    .line 31
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    invoke-virtual {v0}, Lb/f/a/b/q;->e()I

    move-result v0

    .line 32
    iget v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->B:I

    if-ne p1, v1, :cond_49

    iget v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->D:I

    if-ne v0, v1, :cond_49

    return-void

    .line 33
    :cond_49
    iput p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->B:I

    .line 34
    iput v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->D:I

    .line 35
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    invoke-virtual {v1, p1, v0}, Lb/f/a/b/q;->a(II)V

    .line 36
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->E0:Landroidx/constraintlayout/motion/widget/MotionLayout$e;

    iget-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->j:Lb/f/b/k/f;

    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    iget v2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->B:I

    invoke-virtual {v1, v2}, Lb/f/a/b/q;->a(I)Lb/f/c/c;

    move-result-object v1

    iget-object v2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    iget v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->D:I

    invoke-virtual {v2, v3}, Lb/f/a/b/q;->a(I)Lb/f/c/c;

    move-result-object v2

    invoke-virtual {p1, v0, v1, v2}, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->a(Lb/f/b/k/f;Lb/f/c/c;Lb/f/c/c;)V

    .line 37
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->E0:Landroidx/constraintlayout/motion/widget/MotionLayout$e;

    iget v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->B:I

    iget v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->D:I

    invoke-virtual {p1, v0, v1}, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->c(II)V

    .line 38
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->E0:Landroidx/constraintlayout/motion/widget/MotionLayout$e;

    invoke-virtual {p1}, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->b()V

    .line 39
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->n()V

    return-void
.end method

.method public setTransitionDuration(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y:Lb/f/a/b/q;

    if-nez v0, :cond_c

    const-string p1, "MotionLayout"

    const-string v0, "MotionScene not defined"

    .line 2
    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 3
    :cond_c
    invoke-virtual {v0, p1}, Lb/f/a/b/q;->g(I)V

    return-void
.end method

.method public setTransitionListener(Landroidx/constraintlayout/motion/widget/MotionLayout$i;)V
    .registers 2

    .line 1
    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->Q:Landroidx/constraintlayout/motion/widget/MotionLayout$i;

    return-void
.end method

.method public setTransitionState(Landroid/os/Bundle;)V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C0:Landroidx/constraintlayout/motion/widget/MotionLayout$h;

    if-nez v0, :cond_b

    .line 2
    new-instance v0, Landroidx/constraintlayout/motion/widget/MotionLayout$h;

    invoke-direct {v0, p0}, Landroidx/constraintlayout/motion/widget/MotionLayout$h;-><init>(Landroidx/constraintlayout/motion/widget/MotionLayout;)V

    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C0:Landroidx/constraintlayout/motion/widget/MotionLayout$h;

    .line 3
    :cond_b
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C0:Landroidx/constraintlayout/motion/widget/MotionLayout$h;

    invoke-virtual {v0, p1}, Landroidx/constraintlayout/motion/widget/MotionLayout$h;->a(Landroid/os/Bundle;)V

    .line 4
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->isAttachedToWindow()Z

    move-result p1

    if-eqz p1, :cond_1b

    .line 5
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->C0:Landroidx/constraintlayout/motion/widget/MotionLayout$h;

    invoke-virtual {p1}, Landroidx/constraintlayout/motion/widget/MotionLayout$h;->a()V

    :cond_1b
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget v2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->B:I

    invoke-static {v0, v2}, Lb/f/a/b/a;->a(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "->"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->D:I

    .line 3
    invoke-static {v0, v2}, Lb/f/a/b/a;->a(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " (pos:"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->L:F

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v0, " Dpos/Dt:"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout;->A:F

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
