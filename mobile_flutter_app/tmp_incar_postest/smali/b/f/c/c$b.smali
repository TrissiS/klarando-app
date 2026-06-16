.class public Lb/f/c/c$b;
.super Ljava/lang/Object;
.source "ConstraintSet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/f/c/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# static fields
.field public static k0:Landroid/util/SparseIntArray;


# instance fields
.field public A:I

.field public B:I

.field public C:I

.field public D:I

.field public E:I

.field public F:I

.field public G:I

.field public H:I

.field public I:I

.field public J:I

.field public K:I

.field public L:I

.field public M:I

.field public N:I

.field public O:I

.field public P:F

.field public Q:F

.field public R:I

.field public S:I

.field public T:I

.field public U:I

.field public V:I

.field public W:I

.field public X:I

.field public Y:I

.field public Z:F

.field public a:Z

.field public a0:F

.field public b:Z

.field public b0:I

.field public c:I

.field public c0:I

.field public d:I

.field public d0:I

.field public e:I

.field public e0:[I

.field public f:I

.field public f0:Ljava/lang/String;

.field public g:F

.field public g0:Ljava/lang/String;

.field public h:I

.field public h0:Z

.field public i:I

.field public i0:Z

.field public j:I

.field public j0:Z

.field public k:I

.field public l:I

.field public m:I

.field public n:I

.field public o:I

.field public p:I

.field public q:I

.field public r:I

.field public s:I

.field public t:I

.field public u:F

.field public v:F

.field public w:Ljava/lang/String;

.field public x:I

.field public y:I

.field public z:F


# direct methods
.method public static constructor <clinit>()V
    .registers 3

    .line 1
    new-instance v0, Landroid/util/SparseIntArray;

    invoke-direct {v0}, Landroid/util/SparseIntArray;-><init>()V

    sput-object v0, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    .line 2
    sget v1, Lb/f/c/f;->Layout_layout_constraintLeft_toLeftOf:I

    const/16 v2, 0x18

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 3
    sget-object v0, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Layout_layout_constraintLeft_toRightOf:I

    const/16 v2, 0x19

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 4
    sget-object v0, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Layout_layout_constraintRight_toLeftOf:I

    const/16 v2, 0x1c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 5
    sget-object v0, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Layout_layout_constraintRight_toRightOf:I

    const/16 v2, 0x1d

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 6
    sget-object v0, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Layout_layout_constraintTop_toTopOf:I

    const/16 v2, 0x23

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 7
    sget-object v0, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Layout_layout_constraintTop_toBottomOf:I

    const/16 v2, 0x22

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 8
    sget-object v0, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Layout_layout_constraintBottom_toTopOf:I

    const/4 v2, 0x4

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 9
    sget-object v0, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Layout_layout_constraintBottom_toBottomOf:I

    const/4 v2, 0x3

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 10
    sget-object v0, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Layout_layout_constraintBaseline_toBaselineOf:I

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 11
    sget-object v0, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Layout_layout_editor_absoluteX:I

    const/4 v2, 0x6

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 12
    sget-object v0, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Layout_layout_editor_absoluteY:I

    const/4 v2, 0x7

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 13
    sget-object v0, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Layout_layout_constraintGuide_begin:I

    const/16 v2, 0x11

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 14
    sget-object v0, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Layout_layout_constraintGuide_end:I

    const/16 v2, 0x12

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 15
    sget-object v0, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Layout_layout_constraintGuide_percent:I

    const/16 v2, 0x13

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 16
    sget-object v0, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Layout_android_orientation:I

    const/16 v2, 0x1a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 17
    sget-object v0, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Layout_layout_constraintStart_toEndOf:I

    const/16 v2, 0x1f

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 18
    sget-object v0, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Layout_layout_constraintStart_toStartOf:I

    const/16 v2, 0x20

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 19
    sget-object v0, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Layout_layout_constraintEnd_toStartOf:I

    const/16 v2, 0xa

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 20
    sget-object v0, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Layout_layout_constraintEnd_toEndOf:I

    const/16 v2, 0x9

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 21
    sget-object v0, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Layout_layout_goneMarginLeft:I

    const/16 v2, 0xd

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 22
    sget-object v0, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Layout_layout_goneMarginTop:I

    const/16 v2, 0x10

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 23
    sget-object v0, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Layout_layout_goneMarginRight:I

    const/16 v2, 0xe

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 24
    sget-object v0, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Layout_layout_goneMarginBottom:I

    const/16 v2, 0xb

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 25
    sget-object v0, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Layout_layout_goneMarginStart:I

    const/16 v2, 0xf

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 26
    sget-object v0, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Layout_layout_goneMarginEnd:I

    const/16 v2, 0xc

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 27
    sget-object v0, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Layout_layout_constraintVertical_weight:I

    const/16 v2, 0x26

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 28
    sget-object v0, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Layout_layout_constraintHorizontal_weight:I

    const/16 v2, 0x25

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 29
    sget-object v0, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Layout_layout_constraintHorizontal_chainStyle:I

    const/16 v2, 0x27

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 30
    sget-object v0, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Layout_layout_constraintVertical_chainStyle:I

    const/16 v2, 0x28

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 31
    sget-object v0, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Layout_layout_constraintHorizontal_bias:I

    const/16 v2, 0x14

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 32
    sget-object v0, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Layout_layout_constraintVertical_bias:I

    const/16 v2, 0x24

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 33
    sget-object v0, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Layout_layout_constraintDimensionRatio:I

    const/4 v2, 0x5

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 34
    sget-object v0, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Layout_layout_constraintLeft_creator:I

    const/16 v2, 0x4c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 35
    sget-object v0, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Layout_layout_constraintTop_creator:I

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 36
    sget-object v0, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Layout_layout_constraintRight_creator:I

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 37
    sget-object v0, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Layout_layout_constraintBottom_creator:I

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 38
    sget-object v0, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Layout_layout_constraintBaseline_creator:I

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 39
    sget-object v0, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Layout_android_layout_marginLeft:I

    const/16 v2, 0x17

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 40
    sget-object v0, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Layout_android_layout_marginRight:I

    const/16 v2, 0x1b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 41
    sget-object v0, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Layout_android_layout_marginStart:I

    const/16 v2, 0x1e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 42
    sget-object v0, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Layout_android_layout_marginEnd:I

    const/16 v2, 0x8

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 43
    sget-object v0, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Layout_android_layout_marginTop:I

    const/16 v2, 0x21

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 44
    sget-object v0, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Layout_android_layout_marginBottom:I

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 45
    sget-object v0, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Layout_android_layout_width:I

    const/16 v2, 0x16

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 46
    sget-object v0, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Layout_android_layout_height:I

    const/16 v2, 0x15

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 47
    sget-object v0, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Layout_layout_constraintCircle:I

    const/16 v2, 0x3d

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 48
    sget-object v0, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Layout_layout_constraintCircleRadius:I

    const/16 v2, 0x3e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 49
    sget-object v0, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Layout_layout_constraintCircleAngle:I

    const/16 v2, 0x3f

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 50
    sget-object v0, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Layout_layout_constraintWidth_percent:I

    const/16 v2, 0x45

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 51
    sget-object v0, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Layout_layout_constraintHeight_percent:I

    const/16 v2, 0x46

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 52
    sget-object v0, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Layout_chainUseRtl:I

    const/16 v2, 0x47

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 53
    sget-object v0, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Layout_barrierDirection:I

    const/16 v2, 0x48

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 54
    sget-object v0, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Layout_barrierMargin:I

    const/16 v2, 0x49

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 55
    sget-object v0, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Layout_constraint_referenced_ids:I

    const/16 v2, 0x4a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 56
    sget-object v0, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Layout_barrierAllowsGoneWidgets:I

    const/16 v2, 0x4b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    return-void
.end method

.method public constructor <init>()V
    .registers 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lb/f/c/c$b;->a:Z

    .line 3
    iput-boolean v0, p0, Lb/f/c/c$b;->b:Z

    const/4 v1, -0x1

    .line 4
    iput v1, p0, Lb/f/c/c$b;->e:I

    .line 5
    iput v1, p0, Lb/f/c/c$b;->f:I

    const/high16 v2, -0x40800000    # -1.0f

    .line 6
    iput v2, p0, Lb/f/c/c$b;->g:F

    .line 7
    iput v1, p0, Lb/f/c/c$b;->h:I

    .line 8
    iput v1, p0, Lb/f/c/c$b;->i:I

    .line 9
    iput v1, p0, Lb/f/c/c$b;->j:I

    .line 10
    iput v1, p0, Lb/f/c/c$b;->k:I

    .line 11
    iput v1, p0, Lb/f/c/c$b;->l:I

    .line 12
    iput v1, p0, Lb/f/c/c$b;->m:I

    .line 13
    iput v1, p0, Lb/f/c/c$b;->n:I

    .line 14
    iput v1, p0, Lb/f/c/c$b;->o:I

    .line 15
    iput v1, p0, Lb/f/c/c$b;->p:I

    .line 16
    iput v1, p0, Lb/f/c/c$b;->q:I

    .line 17
    iput v1, p0, Lb/f/c/c$b;->r:I

    .line 18
    iput v1, p0, Lb/f/c/c$b;->s:I

    .line 19
    iput v1, p0, Lb/f/c/c$b;->t:I

    const/high16 v3, 0x3f000000    # 0.5f

    .line 20
    iput v3, p0, Lb/f/c/c$b;->u:F

    .line 21
    iput v3, p0, Lb/f/c/c$b;->v:F

    const/4 v3, 0x0

    .line 22
    iput-object v3, p0, Lb/f/c/c$b;->w:Ljava/lang/String;

    .line 23
    iput v1, p0, Lb/f/c/c$b;->x:I

    .line 24
    iput v0, p0, Lb/f/c/c$b;->y:I

    const/4 v3, 0x0

    .line 25
    iput v3, p0, Lb/f/c/c$b;->z:F

    .line 26
    iput v1, p0, Lb/f/c/c$b;->A:I

    .line 27
    iput v1, p0, Lb/f/c/c$b;->B:I

    .line 28
    iput v1, p0, Lb/f/c/c$b;->C:I

    .line 29
    iput v1, p0, Lb/f/c/c$b;->D:I

    .line 30
    iput v1, p0, Lb/f/c/c$b;->E:I

    .line 31
    iput v1, p0, Lb/f/c/c$b;->F:I

    .line 32
    iput v1, p0, Lb/f/c/c$b;->G:I

    .line 33
    iput v1, p0, Lb/f/c/c$b;->H:I

    .line 34
    iput v1, p0, Lb/f/c/c$b;->I:I

    .line 35
    iput v1, p0, Lb/f/c/c$b;->J:I

    .line 36
    iput v1, p0, Lb/f/c/c$b;->K:I

    .line 37
    iput v1, p0, Lb/f/c/c$b;->L:I

    .line 38
    iput v1, p0, Lb/f/c/c$b;->M:I

    .line 39
    iput v1, p0, Lb/f/c/c$b;->N:I

    .line 40
    iput v1, p0, Lb/f/c/c$b;->O:I

    .line 41
    iput v2, p0, Lb/f/c/c$b;->P:F

    .line 42
    iput v2, p0, Lb/f/c/c$b;->Q:F

    .line 43
    iput v0, p0, Lb/f/c/c$b;->R:I

    .line 44
    iput v0, p0, Lb/f/c/c$b;->S:I

    .line 45
    iput v0, p0, Lb/f/c/c$b;->T:I

    .line 46
    iput v0, p0, Lb/f/c/c$b;->U:I

    .line 47
    iput v1, p0, Lb/f/c/c$b;->V:I

    .line 48
    iput v1, p0, Lb/f/c/c$b;->W:I

    .line 49
    iput v1, p0, Lb/f/c/c$b;->X:I

    .line 50
    iput v1, p0, Lb/f/c/c$b;->Y:I

    const/high16 v2, 0x3f800000    # 1.0f

    .line 51
    iput v2, p0, Lb/f/c/c$b;->Z:F

    .line 52
    iput v2, p0, Lb/f/c/c$b;->a0:F

    .line 53
    iput v1, p0, Lb/f/c/c$b;->b0:I

    .line 54
    iput v0, p0, Lb/f/c/c$b;->c0:I

    .line 55
    iput v1, p0, Lb/f/c/c$b;->d0:I

    .line 56
    iput-boolean v0, p0, Lb/f/c/c$b;->h0:Z

    .line 57
    iput-boolean v0, p0, Lb/f/c/c$b;->i0:Z

    const/4 v0, 0x1

    .line 58
    iput-boolean v0, p0, Lb/f/c/c$b;->j0:Z

    return-void
.end method


# virtual methods
.method public a(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 9

    .line 65
    sget-object v0, Lb/f/c/f;->Layout:[I

    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    const/4 p2, 0x1

    .line 66
    iput-boolean p2, p0, Lb/f/c/c$b;->b:Z

    .line 67
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->getIndexCount()I

    move-result p2

    const/4 v0, 0x0

    :goto_e
    if-ge v0, p2, :cond_2c2

    .line 68
    invoke-virtual {p1, v0}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v1

    .line 69
    sget-object v2, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    invoke-virtual {v2, v1}, Landroid/util/SparseIntArray;->get(I)I

    move-result v2

    const/16 v3, 0x50

    if-eq v2, v3, :cond_2b6

    const/16 v3, 0x51

    if-eq v2, v3, :cond_2ad

    const/16 v3, 0x11

    packed-switch v2, :pswitch_data_2c6

    packed-switch v2, :pswitch_data_31a

    packed-switch v2, :pswitch_data_32a

    const/high16 v3, 0x3f800000    # 1.0f

    const-string v4, "   "

    const-string v5, "ConstraintSet"

    packed-switch v2, :pswitch_data_334

    .line 70
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unknown attribute 0x"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v3, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    invoke-virtual {v3, v1}, Landroid/util/SparseIntArray;->get(I)I

    move-result v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 72
    invoke-static {v5, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2be

    .line 73
    :pswitch_5c
    invoke-virtual {p1, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lb/f/c/c$b;->g0:Ljava/lang/String;

    goto/16 :goto_2be

    .line 74
    :pswitch_64
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "unused attribute 0x"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v3, Lb/f/c/c$b;->k0:Landroid/util/SparseIntArray;

    invoke-virtual {v3, v1}, Landroid/util/SparseIntArray;->get(I)I

    move-result v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 76
    invoke-static {v5, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2be

    .line 77
    :pswitch_8a
    iget-boolean v2, p0, Lb/f/c/c$b;->j0:Z

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    iput-boolean v1, p0, Lb/f/c/c$b;->j0:Z

    goto/16 :goto_2be

    .line 78
    :pswitch_94
    invoke-virtual {p1, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lb/f/c/c$b;->f0:Ljava/lang/String;

    goto/16 :goto_2be

    .line 79
    :pswitch_9c
    iget v2, p0, Lb/f/c/c$b;->c0:I

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lb/f/c/c$b;->c0:I

    goto/16 :goto_2be

    .line 80
    :pswitch_a6
    iget v2, p0, Lb/f/c/c$b;->b0:I

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    iput v1, p0, Lb/f/c/c$b;->b0:I

    goto/16 :goto_2be

    :pswitch_b0
    const-string v1, "CURRENTLY UNSUPPORTED"

    .line 81
    invoke-static {v5, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2be

    .line 82
    :pswitch_b7
    invoke-virtual {p1, v1, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v1

    iput v1, p0, Lb/f/c/c$b;->a0:F

    goto/16 :goto_2be

    .line 83
    :pswitch_bf
    invoke-virtual {p1, v1, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v1

    iput v1, p0, Lb/f/c/c$b;->Z:F

    goto/16 :goto_2be

    .line 84
    :pswitch_c7
    iget v2, p0, Lb/f/c/c$b;->z:F

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v1

    iput v1, p0, Lb/f/c/c$b;->z:F

    goto/16 :goto_2be

    .line 85
    :pswitch_d1
    iget v2, p0, Lb/f/c/c$b;->y:I

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lb/f/c/c$b;->y:I

    goto/16 :goto_2be

    .line 86
    :pswitch_db
    iget v2, p0, Lb/f/c/c$b;->x:I

    invoke-static {p1, v1, v2}, Lb/f/c/c;->a(Landroid/content/res/TypedArray;II)I

    move-result v1

    iput v1, p0, Lb/f/c/c$b;->x:I

    goto/16 :goto_2be

    .line 87
    :pswitch_e5
    iget v2, p0, Lb/f/c/c$b;->Y:I

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lb/f/c/c$b;->Y:I

    goto/16 :goto_2be

    .line 88
    :pswitch_ef
    iget v2, p0, Lb/f/c/c$b;->X:I

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lb/f/c/c$b;->X:I

    goto/16 :goto_2be

    .line 89
    :pswitch_f9
    iget v2, p0, Lb/f/c/c$b;->W:I

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lb/f/c/c$b;->W:I

    goto/16 :goto_2be

    .line 90
    :pswitch_103
    iget v2, p0, Lb/f/c/c$b;->V:I

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lb/f/c/c$b;->V:I

    goto/16 :goto_2be

    .line 91
    :pswitch_10d
    iget v2, p0, Lb/f/c/c$b;->U:I

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    iput v1, p0, Lb/f/c/c$b;->U:I

    goto/16 :goto_2be

    .line 92
    :pswitch_117
    iget v2, p0, Lb/f/c/c$b;->T:I

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    iput v1, p0, Lb/f/c/c$b;->T:I

    goto/16 :goto_2be

    .line 93
    :pswitch_121
    iget v2, p0, Lb/f/c/c$b;->S:I

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    iput v1, p0, Lb/f/c/c$b;->S:I

    goto/16 :goto_2be

    .line 94
    :pswitch_12b
    iget v2, p0, Lb/f/c/c$b;->R:I

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    iput v1, p0, Lb/f/c/c$b;->R:I

    goto/16 :goto_2be

    .line 95
    :pswitch_135
    iget v2, p0, Lb/f/c/c$b;->P:F

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v1

    iput v1, p0, Lb/f/c/c$b;->P:F

    goto/16 :goto_2be

    .line 96
    :pswitch_13f
    iget v2, p0, Lb/f/c/c$b;->Q:F

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v1

    iput v1, p0, Lb/f/c/c$b;->Q:F

    goto/16 :goto_2be

    .line 97
    :pswitch_149
    iget v2, p0, Lb/f/c/c$b;->v:F

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v1

    iput v1, p0, Lb/f/c/c$b;->v:F

    goto/16 :goto_2be

    .line 98
    :pswitch_153
    iget v2, p0, Lb/f/c/c$b;->l:I

    invoke-static {p1, v1, v2}, Lb/f/c/c;->a(Landroid/content/res/TypedArray;II)I

    move-result v1

    iput v1, p0, Lb/f/c/c$b;->l:I

    goto/16 :goto_2be

    .line 99
    :pswitch_15d
    iget v2, p0, Lb/f/c/c$b;->m:I

    invoke-static {p1, v1, v2}, Lb/f/c/c;->a(Landroid/content/res/TypedArray;II)I

    move-result v1

    iput v1, p0, Lb/f/c/c$b;->m:I

    goto/16 :goto_2be

    .line 100
    :pswitch_167
    iget v2, p0, Lb/f/c/c$b;->F:I

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lb/f/c/c$b;->F:I

    goto/16 :goto_2be

    .line 101
    :pswitch_171
    iget v2, p0, Lb/f/c/c$b;->r:I

    invoke-static {p1, v1, v2}, Lb/f/c/c;->a(Landroid/content/res/TypedArray;II)I

    move-result v1

    iput v1, p0, Lb/f/c/c$b;->r:I

    goto/16 :goto_2be

    .line 102
    :pswitch_17b
    iget v2, p0, Lb/f/c/c$b;->q:I

    invoke-static {p1, v1, v2}, Lb/f/c/c;->a(Landroid/content/res/TypedArray;II)I

    move-result v1

    iput v1, p0, Lb/f/c/c$b;->q:I

    goto/16 :goto_2be

    .line 103
    :pswitch_185
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v2, v3, :cond_2be

    .line 104
    iget v2, p0, Lb/f/c/c$b;->I:I

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lb/f/c/c$b;->I:I

    goto/16 :goto_2be

    .line 105
    :pswitch_193
    iget v2, p0, Lb/f/c/c$b;->k:I

    invoke-static {p1, v1, v2}, Lb/f/c/c;->a(Landroid/content/res/TypedArray;II)I

    move-result v1

    iput v1, p0, Lb/f/c/c$b;->k:I

    goto/16 :goto_2be

    .line 106
    :pswitch_19d
    iget v2, p0, Lb/f/c/c$b;->j:I

    invoke-static {p1, v1, v2}, Lb/f/c/c;->a(Landroid/content/res/TypedArray;II)I

    move-result v1

    iput v1, p0, Lb/f/c/c$b;->j:I

    goto/16 :goto_2be

    .line 107
    :pswitch_1a7
    iget v2, p0, Lb/f/c/c$b;->E:I

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lb/f/c/c$b;->E:I

    goto/16 :goto_2be

    .line 108
    :pswitch_1b1
    iget v2, p0, Lb/f/c/c$b;->C:I

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    iput v1, p0, Lb/f/c/c$b;->C:I

    goto/16 :goto_2be

    .line 109
    :pswitch_1bb
    iget v2, p0, Lb/f/c/c$b;->i:I

    invoke-static {p1, v1, v2}, Lb/f/c/c;->a(Landroid/content/res/TypedArray;II)I

    move-result v1

    iput v1, p0, Lb/f/c/c$b;->i:I

    goto/16 :goto_2be

    .line 110
    :pswitch_1c5
    iget v2, p0, Lb/f/c/c$b;->h:I

    invoke-static {p1, v1, v2}, Lb/f/c/c;->a(Landroid/content/res/TypedArray;II)I

    move-result v1

    iput v1, p0, Lb/f/c/c$b;->h:I

    goto/16 :goto_2be

    .line 111
    :pswitch_1cf
    iget v2, p0, Lb/f/c/c$b;->D:I

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lb/f/c/c$b;->D:I

    goto/16 :goto_2be

    .line 112
    :pswitch_1d9
    iget v2, p0, Lb/f/c/c$b;->c:I

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getLayoutDimension(II)I

    move-result v1

    iput v1, p0, Lb/f/c/c$b;->c:I

    goto/16 :goto_2be

    .line 113
    :pswitch_1e3
    iget v2, p0, Lb/f/c/c$b;->d:I

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getLayoutDimension(II)I

    move-result v1

    iput v1, p0, Lb/f/c/c$b;->d:I

    goto/16 :goto_2be

    .line 114
    :pswitch_1ed
    iget v2, p0, Lb/f/c/c$b;->u:F

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v1

    iput v1, p0, Lb/f/c/c$b;->u:F

    goto/16 :goto_2be

    .line 115
    :pswitch_1f7
    iget v2, p0, Lb/f/c/c$b;->g:F

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v1

    iput v1, p0, Lb/f/c/c$b;->g:F

    goto/16 :goto_2be

    .line 116
    :pswitch_201
    iget v2, p0, Lb/f/c/c$b;->f:I

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v1

    iput v1, p0, Lb/f/c/c$b;->f:I

    goto/16 :goto_2be

    .line 117
    :pswitch_20b
    iget v2, p0, Lb/f/c/c$b;->e:I

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v1

    iput v1, p0, Lb/f/c/c$b;->e:I

    goto/16 :goto_2be

    .line 118
    :pswitch_215
    iget v2, p0, Lb/f/c/c$b;->K:I

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lb/f/c/c$b;->K:I

    goto/16 :goto_2be

    .line 119
    :pswitch_21f
    iget v2, p0, Lb/f/c/c$b;->O:I

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lb/f/c/c$b;->O:I

    goto/16 :goto_2be

    .line 120
    :pswitch_229
    iget v2, p0, Lb/f/c/c$b;->L:I

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lb/f/c/c$b;->L:I

    goto/16 :goto_2be

    .line 121
    :pswitch_233
    iget v2, p0, Lb/f/c/c$b;->J:I

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lb/f/c/c$b;->J:I

    goto/16 :goto_2be

    .line 122
    :pswitch_23d
    iget v2, p0, Lb/f/c/c$b;->N:I

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lb/f/c/c$b;->N:I

    goto/16 :goto_2be

    .line 123
    :pswitch_247
    iget v2, p0, Lb/f/c/c$b;->M:I

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lb/f/c/c$b;->M:I

    goto/16 :goto_2be

    .line 124
    :pswitch_251
    iget v2, p0, Lb/f/c/c$b;->s:I

    invoke-static {p1, v1, v2}, Lb/f/c/c;->a(Landroid/content/res/TypedArray;II)I

    move-result v1

    iput v1, p0, Lb/f/c/c$b;->s:I

    goto :goto_2be

    .line 125
    :pswitch_25a
    iget v2, p0, Lb/f/c/c$b;->t:I

    invoke-static {p1, v1, v2}, Lb/f/c/c;->a(Landroid/content/res/TypedArray;II)I

    move-result v1

    iput v1, p0, Lb/f/c/c$b;->t:I

    goto :goto_2be

    .line 126
    :pswitch_263
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v2, v3, :cond_2be

    .line 127
    iget v2, p0, Lb/f/c/c$b;->H:I

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lb/f/c/c$b;->H:I

    goto :goto_2be

    .line 128
    :pswitch_270
    iget v2, p0, Lb/f/c/c$b;->B:I

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v1

    iput v1, p0, Lb/f/c/c$b;->B:I

    goto :goto_2be

    .line 129
    :pswitch_279
    iget v2, p0, Lb/f/c/c$b;->A:I

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v1

    iput v1, p0, Lb/f/c/c$b;->A:I

    goto :goto_2be

    .line 130
    :pswitch_282
    invoke-virtual {p1, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lb/f/c/c$b;->w:Ljava/lang/String;

    goto :goto_2be

    .line 131
    :pswitch_289
    iget v2, p0, Lb/f/c/c$b;->n:I

    invoke-static {p1, v1, v2}, Lb/f/c/c;->a(Landroid/content/res/TypedArray;II)I

    move-result v1

    iput v1, p0, Lb/f/c/c$b;->n:I

    goto :goto_2be

    .line 132
    :pswitch_292
    iget v2, p0, Lb/f/c/c$b;->o:I

    invoke-static {p1, v1, v2}, Lb/f/c/c;->a(Landroid/content/res/TypedArray;II)I

    move-result v1

    iput v1, p0, Lb/f/c/c$b;->o:I

    goto :goto_2be

    .line 133
    :pswitch_29b
    iget v2, p0, Lb/f/c/c$b;->G:I

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lb/f/c/c$b;->G:I

    goto :goto_2be

    .line 134
    :pswitch_2a4
    iget v2, p0, Lb/f/c/c$b;->p:I

    invoke-static {p1, v1, v2}, Lb/f/c/c;->a(Landroid/content/res/TypedArray;II)I

    move-result v1

    iput v1, p0, Lb/f/c/c$b;->p:I

    goto :goto_2be

    .line 135
    :cond_2ad
    iget-boolean v2, p0, Lb/f/c/c$b;->i0:Z

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    iput-boolean v1, p0, Lb/f/c/c$b;->i0:Z

    goto :goto_2be

    .line 136
    :cond_2b6
    iget-boolean v2, p0, Lb/f/c/c$b;->h0:Z

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    iput-boolean v1, p0, Lb/f/c/c$b;->h0:Z

    :cond_2be
    :goto_2be
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_e

    .line 137
    :cond_2c2
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void

    :pswitch_data_2c6
    .packed-switch 0x1
        :pswitch_2a4
        :pswitch_29b
        :pswitch_292
        :pswitch_289
        :pswitch_282
        :pswitch_279
        :pswitch_270
        :pswitch_263
        :pswitch_25a
        :pswitch_251
        :pswitch_247
        :pswitch_23d
        :pswitch_233
        :pswitch_229
        :pswitch_21f
        :pswitch_215
        :pswitch_20b
        :pswitch_201
        :pswitch_1f7
        :pswitch_1ed
        :pswitch_1e3
        :pswitch_1d9
        :pswitch_1cf
        :pswitch_1c5
        :pswitch_1bb
        :pswitch_1b1
        :pswitch_1a7
        :pswitch_19d
        :pswitch_193
        :pswitch_185
        :pswitch_17b
        :pswitch_171
        :pswitch_167
        :pswitch_15d
        :pswitch_153
        :pswitch_149
        :pswitch_13f
        :pswitch_135
        :pswitch_12b
        :pswitch_121
    .end packed-switch

    :pswitch_data_31a
    .packed-switch 0x36
        :pswitch_117
        :pswitch_10d
        :pswitch_103
        :pswitch_f9
        :pswitch_ef
        :pswitch_e5
    .end packed-switch

    :pswitch_data_32a
    .packed-switch 0x3d
        :pswitch_db
        :pswitch_d1
        :pswitch_c7
    .end packed-switch

    :pswitch_data_334
    .packed-switch 0x45
        :pswitch_bf
        :pswitch_b7
        :pswitch_b0
        :pswitch_a6
        :pswitch_9c
        :pswitch_94
        :pswitch_8a
        :pswitch_64
        :pswitch_5c
    .end packed-switch
.end method

.method public a(Lb/f/c/c$b;)V
    .registers 4

    .line 1
    iget-boolean v0, p1, Lb/f/c/c$b;->a:Z

    iput-boolean v0, p0, Lb/f/c/c$b;->a:Z

    .line 2
    iget v0, p1, Lb/f/c/c$b;->c:I

    iput v0, p0, Lb/f/c/c$b;->c:I

    .line 3
    iget-boolean v0, p1, Lb/f/c/c$b;->b:Z

    iput-boolean v0, p0, Lb/f/c/c$b;->b:Z

    .line 4
    iget v0, p1, Lb/f/c/c$b;->d:I

    iput v0, p0, Lb/f/c/c$b;->d:I

    .line 5
    iget v0, p1, Lb/f/c/c$b;->e:I

    iput v0, p0, Lb/f/c/c$b;->e:I

    .line 6
    iget v0, p1, Lb/f/c/c$b;->f:I

    iput v0, p0, Lb/f/c/c$b;->f:I

    .line 7
    iget v0, p1, Lb/f/c/c$b;->g:F

    iput v0, p0, Lb/f/c/c$b;->g:F

    .line 8
    iget v0, p1, Lb/f/c/c$b;->h:I

    iput v0, p0, Lb/f/c/c$b;->h:I

    .line 9
    iget v0, p1, Lb/f/c/c$b;->i:I

    iput v0, p0, Lb/f/c/c$b;->i:I

    .line 10
    iget v0, p1, Lb/f/c/c$b;->j:I

    iput v0, p0, Lb/f/c/c$b;->j:I

    .line 11
    iget v0, p1, Lb/f/c/c$b;->k:I

    iput v0, p0, Lb/f/c/c$b;->k:I

    .line 12
    iget v0, p1, Lb/f/c/c$b;->l:I

    iput v0, p0, Lb/f/c/c$b;->l:I

    .line 13
    iget v0, p1, Lb/f/c/c$b;->m:I

    iput v0, p0, Lb/f/c/c$b;->m:I

    .line 14
    iget v0, p1, Lb/f/c/c$b;->n:I

    iput v0, p0, Lb/f/c/c$b;->n:I

    .line 15
    iget v0, p1, Lb/f/c/c$b;->o:I

    iput v0, p0, Lb/f/c/c$b;->o:I

    .line 16
    iget v0, p1, Lb/f/c/c$b;->p:I

    iput v0, p0, Lb/f/c/c$b;->p:I

    .line 17
    iget v0, p1, Lb/f/c/c$b;->q:I

    iput v0, p0, Lb/f/c/c$b;->q:I

    .line 18
    iget v0, p1, Lb/f/c/c$b;->r:I

    iput v0, p0, Lb/f/c/c$b;->r:I

    .line 19
    iget v0, p1, Lb/f/c/c$b;->s:I

    iput v0, p0, Lb/f/c/c$b;->s:I

    .line 20
    iget v0, p1, Lb/f/c/c$b;->t:I

    iput v0, p0, Lb/f/c/c$b;->t:I

    .line 21
    iget v0, p1, Lb/f/c/c$b;->u:F

    iput v0, p0, Lb/f/c/c$b;->u:F

    .line 22
    iget v0, p1, Lb/f/c/c$b;->v:F

    iput v0, p0, Lb/f/c/c$b;->v:F

    .line 23
    iget-object v0, p1, Lb/f/c/c$b;->w:Ljava/lang/String;

    iput-object v0, p0, Lb/f/c/c$b;->w:Ljava/lang/String;

    .line 24
    iget v0, p1, Lb/f/c/c$b;->x:I

    iput v0, p0, Lb/f/c/c$b;->x:I

    .line 25
    iget v0, p1, Lb/f/c/c$b;->y:I

    iput v0, p0, Lb/f/c/c$b;->y:I

    .line 26
    iget v0, p1, Lb/f/c/c$b;->z:F

    iput v0, p0, Lb/f/c/c$b;->z:F

    .line 27
    iget v0, p1, Lb/f/c/c$b;->A:I

    iput v0, p0, Lb/f/c/c$b;->A:I

    .line 28
    iget v0, p1, Lb/f/c/c$b;->B:I

    iput v0, p0, Lb/f/c/c$b;->B:I

    .line 29
    iget v0, p1, Lb/f/c/c$b;->C:I

    iput v0, p0, Lb/f/c/c$b;->C:I

    .line 30
    iget v0, p1, Lb/f/c/c$b;->D:I

    iput v0, p0, Lb/f/c/c$b;->D:I

    .line 31
    iget v0, p1, Lb/f/c/c$b;->E:I

    iput v0, p0, Lb/f/c/c$b;->E:I

    .line 32
    iget v0, p1, Lb/f/c/c$b;->F:I

    iput v0, p0, Lb/f/c/c$b;->F:I

    .line 33
    iget v0, p1, Lb/f/c/c$b;->G:I

    iput v0, p0, Lb/f/c/c$b;->G:I

    .line 34
    iget v0, p1, Lb/f/c/c$b;->H:I

    iput v0, p0, Lb/f/c/c$b;->H:I

    .line 35
    iget v0, p1, Lb/f/c/c$b;->I:I

    iput v0, p0, Lb/f/c/c$b;->I:I

    .line 36
    iget v0, p1, Lb/f/c/c$b;->J:I

    iput v0, p0, Lb/f/c/c$b;->J:I

    .line 37
    iget v0, p1, Lb/f/c/c$b;->K:I

    iput v0, p0, Lb/f/c/c$b;->K:I

    .line 38
    iget v0, p1, Lb/f/c/c$b;->L:I

    iput v0, p0, Lb/f/c/c$b;->L:I

    .line 39
    iget v0, p1, Lb/f/c/c$b;->M:I

    iput v0, p0, Lb/f/c/c$b;->M:I

    .line 40
    iget v0, p1, Lb/f/c/c$b;->N:I

    iput v0, p0, Lb/f/c/c$b;->N:I

    .line 41
    iget v0, p1, Lb/f/c/c$b;->O:I

    iput v0, p0, Lb/f/c/c$b;->O:I

    .line 42
    iget v0, p1, Lb/f/c/c$b;->P:F

    iput v0, p0, Lb/f/c/c$b;->P:F

    .line 43
    iget v0, p1, Lb/f/c/c$b;->Q:F

    iput v0, p0, Lb/f/c/c$b;->Q:F

    .line 44
    iget v0, p1, Lb/f/c/c$b;->R:I

    iput v0, p0, Lb/f/c/c$b;->R:I

    .line 45
    iget v0, p1, Lb/f/c/c$b;->S:I

    iput v0, p0, Lb/f/c/c$b;->S:I

    .line 46
    iget v0, p1, Lb/f/c/c$b;->T:I

    iput v0, p0, Lb/f/c/c$b;->T:I

    .line 47
    iget v0, p1, Lb/f/c/c$b;->U:I

    iput v0, p0, Lb/f/c/c$b;->U:I

    .line 48
    iget v0, p1, Lb/f/c/c$b;->V:I

    iput v0, p0, Lb/f/c/c$b;->V:I

    .line 49
    iget v0, p1, Lb/f/c/c$b;->W:I

    iput v0, p0, Lb/f/c/c$b;->W:I

    .line 50
    iget v0, p1, Lb/f/c/c$b;->X:I

    iput v0, p0, Lb/f/c/c$b;->X:I

    .line 51
    iget v0, p1, Lb/f/c/c$b;->Y:I

    iput v0, p0, Lb/f/c/c$b;->Y:I

    .line 52
    iget v0, p1, Lb/f/c/c$b;->Z:F

    iput v0, p0, Lb/f/c/c$b;->Z:F

    .line 53
    iget v0, p1, Lb/f/c/c$b;->a0:F

    iput v0, p0, Lb/f/c/c$b;->a0:F

    .line 54
    iget v0, p1, Lb/f/c/c$b;->b0:I

    iput v0, p0, Lb/f/c/c$b;->b0:I

    .line 55
    iget v0, p1, Lb/f/c/c$b;->c0:I

    iput v0, p0, Lb/f/c/c$b;->c0:I

    .line 56
    iget v0, p1, Lb/f/c/c$b;->d0:I

    iput v0, p0, Lb/f/c/c$b;->d0:I

    .line 57
    iget-object v0, p1, Lb/f/c/c$b;->g0:Ljava/lang/String;

    iput-object v0, p0, Lb/f/c/c$b;->g0:Ljava/lang/String;

    .line 58
    iget-object v0, p1, Lb/f/c/c$b;->e0:[I

    if-eqz v0, :cond_f0

    .line 59
    array-length v1, v0

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v0

    iput-object v0, p0, Lb/f/c/c$b;->e0:[I

    goto :goto_f3

    :cond_f0
    const/4 v0, 0x0

    .line 60
    iput-object v0, p0, Lb/f/c/c$b;->e0:[I

    .line 61
    :goto_f3
    iget-object v0, p1, Lb/f/c/c$b;->f0:Ljava/lang/String;

    iput-object v0, p0, Lb/f/c/c$b;->f0:Ljava/lang/String;

    .line 62
    iget-boolean v0, p1, Lb/f/c/c$b;->h0:Z

    iput-boolean v0, p0, Lb/f/c/c$b;->h0:Z

    .line 63
    iget-boolean v0, p1, Lb/f/c/c$b;->i0:Z

    iput-boolean v0, p0, Lb/f/c/c$b;->i0:Z

    .line 64
    iget-boolean p1, p1, Lb/f/c/c$b;->j0:Z

    iput-boolean p1, p0, Lb/f/c/c$b;->j0:Z

    return-void
.end method
