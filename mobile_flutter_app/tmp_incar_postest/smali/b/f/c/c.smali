.class public Lb/f/c/c;
.super Ljava/lang/Object;
.source "ConstraintSet.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/f/c/c$a;,
        Lb/f/c/c$c;,
        Lb/f/c/c$d;,
        Lb/f/c/c$e;,
        Lb/f/c/c$b;
    }
.end annotation


# static fields
.field public static final d:[I

.field public static e:Landroid/util/SparseIntArray;


# instance fields
.field public a:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lb/f/c/a;",
            ">;"
        }
    .end annotation
.end field

.field public b:Z

.field public c:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Lb/f/c/c$a;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static constructor <clinit>()V
    .registers 4

    const/4 v0, 0x3

    new-array v1, v0, [I

    .line 1
    fill-array-data v1, :array_304

    sput-object v1, Lb/f/c/c;->d:[I

    .line 2
    new-instance v1, Landroid/util/SparseIntArray;

    invoke-direct {v1}, Landroid/util/SparseIntArray;-><init>()V

    sput-object v1, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    .line 3
    sget v2, Lb/f/c/f;->Constraint_layout_constraintLeft_toLeftOf:I

    const/16 v3, 0x19

    invoke-virtual {v1, v2, v3}, Landroid/util/SparseIntArray;->append(II)V

    .line 4
    sget-object v1, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v2, Lb/f/c/f;->Constraint_layout_constraintLeft_toRightOf:I

    const/16 v3, 0x1a

    invoke-virtual {v1, v2, v3}, Landroid/util/SparseIntArray;->append(II)V

    .line 5
    sget-object v1, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v2, Lb/f/c/f;->Constraint_layout_constraintRight_toLeftOf:I

    const/16 v3, 0x1d

    invoke-virtual {v1, v2, v3}, Landroid/util/SparseIntArray;->append(II)V

    .line 6
    sget-object v1, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v2, Lb/f/c/f;->Constraint_layout_constraintRight_toRightOf:I

    const/16 v3, 0x1e

    invoke-virtual {v1, v2, v3}, Landroid/util/SparseIntArray;->append(II)V

    .line 7
    sget-object v1, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v2, Lb/f/c/f;->Constraint_layout_constraintTop_toTopOf:I

    const/16 v3, 0x24

    invoke-virtual {v1, v2, v3}, Landroid/util/SparseIntArray;->append(II)V

    .line 8
    sget-object v1, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v2, Lb/f/c/f;->Constraint_layout_constraintTop_toBottomOf:I

    const/16 v3, 0x23

    invoke-virtual {v1, v2, v3}, Landroid/util/SparseIntArray;->append(II)V

    .line 9
    sget-object v1, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v2, Lb/f/c/f;->Constraint_layout_constraintBottom_toTopOf:I

    const/4 v3, 0x4

    invoke-virtual {v1, v2, v3}, Landroid/util/SparseIntArray;->append(II)V

    .line 10
    sget-object v1, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v2, Lb/f/c/f;->Constraint_layout_constraintBottom_toBottomOf:I

    invoke-virtual {v1, v2, v0}, Landroid/util/SparseIntArray;->append(II)V

    .line 11
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_layout_constraintBaseline_toBaselineOf:I

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 12
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_layout_editor_absoluteX:I

    const/4 v2, 0x6

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 13
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_layout_editor_absoluteY:I

    const/4 v2, 0x7

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 14
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_layout_constraintGuide_begin:I

    const/16 v2, 0x11

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 15
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_layout_constraintGuide_end:I

    const/16 v2, 0x12

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 16
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_layout_constraintGuide_percent:I

    const/16 v2, 0x13

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 17
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_android_orientation:I

    const/16 v2, 0x1b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 18
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_layout_constraintStart_toEndOf:I

    const/16 v2, 0x20

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 19
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_layout_constraintStart_toStartOf:I

    const/16 v2, 0x21

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 20
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_layout_constraintEnd_toStartOf:I

    const/16 v2, 0xa

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 21
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_layout_constraintEnd_toEndOf:I

    const/16 v2, 0x9

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 22
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_layout_goneMarginLeft:I

    const/16 v2, 0xd

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 23
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_layout_goneMarginTop:I

    const/16 v2, 0x10

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 24
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_layout_goneMarginRight:I

    const/16 v2, 0xe

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 25
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_layout_goneMarginBottom:I

    const/16 v2, 0xb

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 26
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_layout_goneMarginStart:I

    const/16 v2, 0xf

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 27
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_layout_goneMarginEnd:I

    const/16 v2, 0xc

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 28
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_layout_constraintVertical_weight:I

    const/16 v2, 0x28

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 29
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_layout_constraintHorizontal_weight:I

    const/16 v2, 0x27

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 30
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_layout_constraintHorizontal_chainStyle:I

    const/16 v2, 0x29

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 31
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_layout_constraintVertical_chainStyle:I

    const/16 v2, 0x2a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 32
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_layout_constraintHorizontal_bias:I

    const/16 v2, 0x14

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 33
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_layout_constraintVertical_bias:I

    const/16 v2, 0x25

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 34
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_layout_constraintDimensionRatio:I

    const/4 v2, 0x5

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 35
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_layout_constraintLeft_creator:I

    const/16 v2, 0x52

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 36
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_layout_constraintTop_creator:I

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 37
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_layout_constraintRight_creator:I

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 38
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_layout_constraintBottom_creator:I

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 39
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_layout_constraintBaseline_creator:I

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 40
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_android_layout_marginLeft:I

    const/16 v2, 0x18

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 41
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_android_layout_marginRight:I

    const/16 v2, 0x1c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 42
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_android_layout_marginStart:I

    const/16 v2, 0x1f

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 43
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_android_layout_marginEnd:I

    const/16 v2, 0x8

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 44
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_android_layout_marginTop:I

    const/16 v2, 0x22

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 45
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_android_layout_marginBottom:I

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 46
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_android_layout_width:I

    const/16 v2, 0x17

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 47
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_android_layout_height:I

    const/16 v2, 0x15

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 48
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_android_visibility:I

    const/16 v2, 0x16

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 49
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_android_alpha:I

    const/16 v2, 0x2b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 50
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_android_elevation:I

    const/16 v2, 0x2c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 51
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_android_rotationX:I

    const/16 v2, 0x2d

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 52
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_android_rotationY:I

    const/16 v2, 0x2e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 53
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_android_rotation:I

    const/16 v2, 0x3c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 54
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_android_scaleX:I

    const/16 v2, 0x2f

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 55
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_android_scaleY:I

    const/16 v2, 0x30

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 56
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_android_transformPivotX:I

    const/16 v2, 0x31

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 57
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_android_transformPivotY:I

    const/16 v2, 0x32

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 58
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_android_translationX:I

    const/16 v2, 0x33

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 59
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_android_translationY:I

    const/16 v2, 0x34

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 60
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_android_translationZ:I

    const/16 v2, 0x35

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 61
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_layout_constraintWidth_default:I

    const/16 v2, 0x36

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 62
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_layout_constraintHeight_default:I

    const/16 v2, 0x37

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 63
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_layout_constraintWidth_max:I

    const/16 v2, 0x38

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 64
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_layout_constraintHeight_max:I

    const/16 v2, 0x39

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 65
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_layout_constraintWidth_min:I

    const/16 v2, 0x3a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 66
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_layout_constraintHeight_min:I

    const/16 v2, 0x3b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 67
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_layout_constraintCircle:I

    const/16 v2, 0x3d

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 68
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_layout_constraintCircleRadius:I

    const/16 v2, 0x3e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 69
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_layout_constraintCircleAngle:I

    const/16 v2, 0x3f

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 70
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_animate_relativeTo:I

    const/16 v2, 0x40

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 71
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_transitionEasing:I

    const/16 v2, 0x41

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 72
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_drawPath:I

    const/16 v2, 0x42

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 73
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_transitionPathRotate:I

    const/16 v2, 0x43

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 74
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_motionStagger:I

    const/16 v2, 0x4f

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 75
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_android_id:I

    const/16 v2, 0x26

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 76
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_motionProgress:I

    const/16 v2, 0x44

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 77
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_layout_constraintWidth_percent:I

    const/16 v2, 0x45

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 78
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_layout_constraintHeight_percent:I

    const/16 v2, 0x46

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 79
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_chainUseRtl:I

    const/16 v2, 0x47

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 80
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_barrierDirection:I

    const/16 v2, 0x48

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 81
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_barrierMargin:I

    const/16 v2, 0x49

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 82
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_constraint_referenced_ids:I

    const/16 v2, 0x4a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 83
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_barrierAllowsGoneWidgets:I

    const/16 v2, 0x4b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 84
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_pathMotionArc:I

    const/16 v2, 0x4c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 85
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_layout_constraintTag:I

    const/16 v2, 0x4d

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 86
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_visibilityMode:I

    const/16 v2, 0x4e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 87
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_layout_constrainedWidth:I

    const/16 v2, 0x50

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 88
    sget-object v0, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->Constraint_layout_constrainedHeight:I

    const/16 v2, 0x51

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    return-void

    :array_304
    .array-data 4
        0x0
        0x4
        0x8
    .end array-data
.end method

.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lb/f/c/c;->a:Ljava/util/HashMap;

    const/4 v0, 0x1

    .line 3
    iput-boolean v0, p0, Lb/f/c/c;->b:Z

    .line 4
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lb/f/c/c;->c:Ljava/util/HashMap;

    return-void
.end method

.method public static synthetic a(Landroid/content/res/TypedArray;II)I
    .registers 3

    .line 1
    invoke-static {p0, p1, p2}, Lb/f/c/c;->b(Landroid/content/res/TypedArray;II)I

    move-result p0

    return p0
.end method

.method public static b(Landroid/content/res/TypedArray;II)I
    .registers 4

    .line 17
    invoke-virtual {p0, p1, p2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p2

    const/4 v0, -0x1

    if-ne p2, v0, :cond_b

    .line 18
    invoke-virtual {p0, p1, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p2

    :cond_b
    return p2
.end method

.method public static synthetic b()[I
    .registers 1

    .line 1
    sget-object v0, Lb/f/c/c;->d:[I

    return-object v0
.end method


# virtual methods
.method public final a(I)Lb/f/c/c$a;
    .registers 5

    .line 156
    iget-object v0, p0, Lb/f/c/c;->c:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1a

    .line 157
    iget-object v0, p0, Lb/f/c/c;->c:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-instance v2, Lb/f/c/c$a;

    invoke-direct {v2}, Lb/f/c/c$a;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 158
    :cond_1a
    iget-object v0, p0, Lb/f/c/c;->c:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lb/f/c/c$a;

    return-object p1
.end method

.method public final a(Landroid/content/Context;Landroid/util/AttributeSet;)Lb/f/c/c$a;
    .registers 5

    .line 186
    new-instance v0, Lb/f/c/c$a;

    invoke-direct {v0}, Lb/f/c/c$a;-><init>()V

    .line 187
    sget-object v1, Lb/f/c/f;->Constraint:[I

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p2

    .line 188
    invoke-virtual {p0, p1, v0, p2}, Lb/f/c/c;->a(Landroid/content/Context;Lb/f/c/c$a;Landroid/content/res/TypedArray;)V

    .line 189
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    return-object v0
.end method

.method public a(II)V
    .registers 5

    .line 124
    iget-object v0, p0, Lb/f/c/c;->c:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6a

    .line 125
    iget-object v0, p0, Lb/f/c/c;->c:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lb/f/c/c$a;

    const/4 v0, -0x1

    packed-switch p2, :pswitch_data_6c

    .line 126
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "unknown constraint"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 127
    :pswitch_24
    iget-object p1, p1, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iput v0, p1, Lb/f/c/c$b;->s:I

    .line 128
    iput v0, p1, Lb/f/c/c$b;->t:I

    .line 129
    iput v0, p1, Lb/f/c/c$b;->H:I

    .line 130
    iput v0, p1, Lb/f/c/c$b;->N:I

    goto :goto_6a

    .line 131
    :pswitch_2f
    iget-object p1, p1, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iput v0, p1, Lb/f/c/c$b;->q:I

    .line 132
    iput v0, p1, Lb/f/c/c$b;->r:I

    .line 133
    iput v0, p1, Lb/f/c/c$b;->I:I

    .line 134
    iput v0, p1, Lb/f/c/c$b;->O:I

    goto :goto_6a

    .line 135
    :pswitch_3a
    iget-object p1, p1, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iput v0, p1, Lb/f/c/c$b;->p:I

    goto :goto_6a

    .line 136
    :pswitch_3f
    iget-object p1, p1, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iput v0, p1, Lb/f/c/c$b;->n:I

    .line 137
    iput v0, p1, Lb/f/c/c$b;->o:I

    .line 138
    iput v0, p1, Lb/f/c/c$b;->G:I

    .line 139
    iput v0, p1, Lb/f/c/c$b;->M:I

    goto :goto_6a

    .line 140
    :pswitch_4a
    iget-object p1, p1, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iput v0, p1, Lb/f/c/c$b;->m:I

    .line 141
    iput v0, p1, Lb/f/c/c$b;->l:I

    .line 142
    iput v0, p1, Lb/f/c/c$b;->F:I

    .line 143
    iput v0, p1, Lb/f/c/c$b;->K:I

    goto :goto_6a

    .line 144
    :pswitch_55
    iget-object p1, p1, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iput v0, p1, Lb/f/c/c$b;->k:I

    .line 145
    iput v0, p1, Lb/f/c/c$b;->j:I

    .line 146
    iput v0, p1, Lb/f/c/c$b;->E:I

    .line 147
    iput v0, p1, Lb/f/c/c$b;->L:I

    goto :goto_6a

    .line 148
    :pswitch_60
    iget-object p1, p1, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iput v0, p1, Lb/f/c/c$b;->i:I

    .line 149
    iput v0, p1, Lb/f/c/c$b;->h:I

    .line 150
    iput v0, p1, Lb/f/c/c$b;->D:I

    .line 151
    iput v0, p1, Lb/f/c/c$b;->J:I

    :cond_6a
    :goto_6a
    return-void

    nop

    :pswitch_data_6c
    .packed-switch 0x1
        :pswitch_60
        :pswitch_55
        :pswitch_4a
        :pswitch_3f
        :pswitch_3a
        :pswitch_2f
        :pswitch_24
    .end packed-switch
.end method

.method public a(IIIF)V
    .registers 5

    .line 152
    invoke-virtual {p0, p1}, Lb/f/c/c;->a(I)Lb/f/c/c$a;

    move-result-object p1

    .line 153
    iget-object p1, p1, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iput p2, p1, Lb/f/c/c$b;->x:I

    .line 154
    iput p3, p1, Lb/f/c/c$b;->y:I

    .line 155
    iput p4, p1, Lb/f/c/c$b;->z:F

    return-void
.end method

.method public a(ILandroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;)V
    .registers 5

    .line 50
    iget-object v0, p0, Lb/f/c/c;->c:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1b

    .line 51
    iget-object v0, p0, Lb/f/c/c;->c:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lb/f/c/c$a;

    .line 52
    invoke-virtual {p1, p2}, Lb/f/c/c$a;->a(Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;)V

    :cond_1b
    return-void
.end method

.method public a(Landroid/content/Context;I)V
    .registers 4

    .line 19
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {p0, p1}, Lb/f/c/c;->c(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    return-void
.end method

.method public final a(Landroid/content/Context;Lb/f/c/c$a;Landroid/content/res/TypedArray;)V
    .registers 14

    .line 190
    invoke-virtual {p3}, Landroid/content/res/TypedArray;->getIndexCount()I

    move-result p1

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_6
    if-ge v1, p1, :cond_46b

    .line 191
    invoke-virtual {p3, v1}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v2

    .line 192
    sget v3, Lb/f/c/f;->Constraint_android_id:I

    const/4 v4, 0x1

    if-eq v2, v3, :cond_29

    sget v3, Lb/f/c/f;->Constraint_android_layout_marginStart:I

    if-eq v3, v2, :cond_29

    sget v3, Lb/f/c/f;->Constraint_android_layout_marginEnd:I

    if-eq v3, v2, :cond_29

    .line 193
    iget-object v3, p2, Lb/f/c/c$a;->c:Lb/f/c/c$c;

    iput-boolean v4, v3, Lb/f/c/c$c;->a:Z

    .line 194
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iput-boolean v4, v3, Lb/f/c/c$b;->b:Z

    .line 195
    iget-object v3, p2, Lb/f/c/c$a;->b:Lb/f/c/c$d;

    iput-boolean v4, v3, Lb/f/c/c$d;->a:Z

    .line 196
    iget-object v3, p2, Lb/f/c/c$a;->e:Lb/f/c/c$e;

    iput-boolean v4, v3, Lb/f/c/c$e;->a:Z

    .line 197
    :cond_29
    sget-object v3, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    invoke-virtual {v3, v2}, Landroid/util/SparseIntArray;->get(I)I

    move-result v3

    const-string v5, "   "

    const/high16 v6, 0x3f800000    # 1.0f

    const/16 v7, 0x15

    const/16 v8, 0x11

    const-string v9, "ConstraintSet"

    packed-switch v3, :pswitch_data_46c

    .line 198
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unknown attribute 0x"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 199
    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v4, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    invoke-virtual {v4, v2}, Landroid/util/SparseIntArray;->get(I)I

    move-result v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 200
    invoke-static {v9, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_467

    .line 201
    :pswitch_62
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "unused attribute 0x"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 202
    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v4, Lb/f/c/c;->e:Landroid/util/SparseIntArray;

    invoke-virtual {v4, v2}, Landroid/util/SparseIntArray;->get(I)I

    move-result v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 203
    invoke-static {v9, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_467

    .line 204
    :pswitch_88
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget-boolean v4, v3, Lb/f/c/c$b;->i0:Z

    invoke-virtual {p3, v2, v4}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    iput-boolean v2, v3, Lb/f/c/c$b;->i0:Z

    goto/16 :goto_467

    .line 205
    :pswitch_94
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget-boolean v4, v3, Lb/f/c/c$b;->h0:Z

    invoke-virtual {p3, v2, v4}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    iput-boolean v2, v3, Lb/f/c/c$b;->h0:Z

    goto/16 :goto_467

    .line 206
    :pswitch_a0
    iget-object v3, p2, Lb/f/c/c$a;->c:Lb/f/c/c$c;

    iget v4, v3, Lb/f/c/c$c;->f:F

    invoke-virtual {p3, v2, v4}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    iput v2, v3, Lb/f/c/c$c;->f:F

    goto/16 :goto_467

    .line 207
    :pswitch_ac
    iget-object v3, p2, Lb/f/c/c$a;->b:Lb/f/c/c$d;

    iget v4, v3, Lb/f/c/c$d;->c:I

    invoke-virtual {p3, v2, v4}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, v3, Lb/f/c/c$d;->c:I

    goto/16 :goto_467

    .line 208
    :pswitch_b8
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    invoke-virtual {p3, v2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v3, Lb/f/c/c$b;->g0:Ljava/lang/String;

    goto/16 :goto_467

    .line 209
    :pswitch_c2
    iget-object v3, p2, Lb/f/c/c$a;->c:Lb/f/c/c$c;

    iget v4, v3, Lb/f/c/c$c;->d:I

    invoke-virtual {p3, v2, v4}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, v3, Lb/f/c/c$c;->d:I

    goto/16 :goto_467

    .line 210
    :pswitch_ce
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget-boolean v4, v3, Lb/f/c/c$b;->j0:Z

    invoke-virtual {p3, v2, v4}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    iput-boolean v2, v3, Lb/f/c/c$b;->j0:Z

    goto/16 :goto_467

    .line 211
    :pswitch_da
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    invoke-virtual {p3, v2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v3, Lb/f/c/c$b;->f0:Ljava/lang/String;

    goto/16 :goto_467

    .line 212
    :pswitch_e4
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v4, v3, Lb/f/c/c$b;->c0:I

    invoke-virtual {p3, v2, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, v3, Lb/f/c/c$b;->c0:I

    goto/16 :goto_467

    .line 213
    :pswitch_f0
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v4, v3, Lb/f/c/c$b;->b0:I

    invoke-virtual {p3, v2, v4}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, v3, Lb/f/c/c$b;->b0:I

    goto/16 :goto_467

    :pswitch_fc
    const-string v2, "CURRENTLY UNSUPPORTED"

    .line 214
    invoke-static {v9, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_467

    .line 215
    :pswitch_103
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    invoke-virtual {p3, v2, v6}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    iput v2, v3, Lb/f/c/c$b;->a0:F

    goto/16 :goto_467

    .line 216
    :pswitch_10d
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    invoke-virtual {p3, v2, v6}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    iput v2, v3, Lb/f/c/c$b;->Z:F

    goto/16 :goto_467

    .line 217
    :pswitch_117
    iget-object v3, p2, Lb/f/c/c$a;->b:Lb/f/c/c$d;

    iget v4, v3, Lb/f/c/c$d;->e:F

    invoke-virtual {p3, v2, v4}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    iput v2, v3, Lb/f/c/c$d;->e:F

    goto/16 :goto_467

    .line 218
    :pswitch_123
    iget-object v3, p2, Lb/f/c/c$a;->c:Lb/f/c/c$c;

    iget v4, v3, Lb/f/c/c$c;->g:F

    invoke-virtual {p3, v2, v4}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    iput v2, v3, Lb/f/c/c$c;->g:F

    goto/16 :goto_467

    .line 219
    :pswitch_12f
    iget-object v3, p2, Lb/f/c/c$a;->c:Lb/f/c/c$c;

    invoke-virtual {p3, v2, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, v3, Lb/f/c/c$c;->e:I

    goto/16 :goto_467

    .line 220
    :pswitch_139
    invoke-virtual {p3, v2}, Landroid/content/res/TypedArray;->peekValue(I)Landroid/util/TypedValue;

    move-result-object v3

    .line 221
    iget v3, v3, Landroid/util/TypedValue;->type:I

    const/4 v4, 0x3

    if-ne v3, v4, :cond_14c

    .line 222
    iget-object v3, p2, Lb/f/c/c$a;->c:Lb/f/c/c$c;

    invoke-virtual {p3, v2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v3, Lb/f/c/c$c;->c:Ljava/lang/String;

    goto/16 :goto_467

    .line 223
    :cond_14c
    iget-object v3, p2, Lb/f/c/c$a;->c:Lb/f/c/c$c;

    sget-object v4, Lb/f/a/a/c;->c:[Ljava/lang/String;

    invoke-virtual {p3, v2, v0}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v2

    aget-object v2, v4, v2

    iput-object v2, v3, Lb/f/c/c$c;->c:Ljava/lang/String;

    goto/16 :goto_467

    .line 224
    :pswitch_15a
    iget-object v3, p2, Lb/f/c/c$a;->c:Lb/f/c/c$c;

    iget v4, v3, Lb/f/c/c$c;->b:I

    invoke-static {p3, v2, v4}, Lb/f/c/c;->b(Landroid/content/res/TypedArray;II)I

    move-result v2

    iput v2, v3, Lb/f/c/c$c;->b:I

    goto/16 :goto_467

    .line 225
    :pswitch_166
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v4, v3, Lb/f/c/c$b;->z:F

    invoke-virtual {p3, v2, v4}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    iput v2, v3, Lb/f/c/c$b;->z:F

    goto/16 :goto_467

    .line 226
    :pswitch_172
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v4, v3, Lb/f/c/c$b;->y:I

    invoke-virtual {p3, v2, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, v3, Lb/f/c/c$b;->y:I

    goto/16 :goto_467

    .line 227
    :pswitch_17e
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v4, v3, Lb/f/c/c$b;->x:I

    invoke-static {p3, v2, v4}, Lb/f/c/c;->b(Landroid/content/res/TypedArray;II)I

    move-result v2

    iput v2, v3, Lb/f/c/c$b;->x:I

    goto/16 :goto_467

    .line 228
    :pswitch_18a
    iget-object v3, p2, Lb/f/c/c$a;->e:Lb/f/c/c$e;

    iget v4, v3, Lb/f/c/c$e;->b:F

    invoke-virtual {p3, v2, v4}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    iput v2, v3, Lb/f/c/c$e;->b:F

    goto/16 :goto_467

    .line 229
    :pswitch_196
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v4, v3, Lb/f/c/c$b;->Y:I

    invoke-virtual {p3, v2, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, v3, Lb/f/c/c$b;->Y:I

    goto/16 :goto_467

    .line 230
    :pswitch_1a2
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v4, v3, Lb/f/c/c$b;->X:I

    invoke-virtual {p3, v2, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, v3, Lb/f/c/c$b;->X:I

    goto/16 :goto_467

    .line 231
    :pswitch_1ae
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v4, v3, Lb/f/c/c$b;->W:I

    invoke-virtual {p3, v2, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, v3, Lb/f/c/c$b;->W:I

    goto/16 :goto_467

    .line 232
    :pswitch_1ba
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v4, v3, Lb/f/c/c$b;->V:I

    invoke-virtual {p3, v2, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, v3, Lb/f/c/c$b;->V:I

    goto/16 :goto_467

    .line 233
    :pswitch_1c6
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v4, v3, Lb/f/c/c$b;->U:I

    invoke-virtual {p3, v2, v4}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, v3, Lb/f/c/c$b;->U:I

    goto/16 :goto_467

    .line 234
    :pswitch_1d2
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v4, v3, Lb/f/c/c$b;->T:I

    invoke-virtual {p3, v2, v4}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, v3, Lb/f/c/c$b;->T:I

    goto/16 :goto_467

    .line 235
    :pswitch_1de
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v3, v7, :cond_467

    .line 236
    iget-object v3, p2, Lb/f/c/c$a;->e:Lb/f/c/c$e;

    iget v4, v3, Lb/f/c/c$e;->k:F

    invoke-virtual {p3, v2, v4}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v2

    iput v2, v3, Lb/f/c/c$e;->k:F

    goto/16 :goto_467

    .line 237
    :pswitch_1ee
    iget-object v3, p2, Lb/f/c/c$a;->e:Lb/f/c/c$e;

    iget v4, v3, Lb/f/c/c$e;->j:F

    invoke-virtual {p3, v2, v4}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v2

    iput v2, v3, Lb/f/c/c$e;->j:F

    goto/16 :goto_467

    .line 238
    :pswitch_1fa
    iget-object v3, p2, Lb/f/c/c$a;->e:Lb/f/c/c$e;

    iget v4, v3, Lb/f/c/c$e;->i:F

    invoke-virtual {p3, v2, v4}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v2

    iput v2, v3, Lb/f/c/c$e;->i:F

    goto/16 :goto_467

    .line 239
    :pswitch_206
    iget-object v3, p2, Lb/f/c/c$a;->e:Lb/f/c/c$e;

    iget v4, v3, Lb/f/c/c$e;->h:F

    invoke-virtual {p3, v2, v4}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v2

    iput v2, v3, Lb/f/c/c$e;->h:F

    goto/16 :goto_467

    .line 240
    :pswitch_212
    iget-object v3, p2, Lb/f/c/c$a;->e:Lb/f/c/c$e;

    iget v4, v3, Lb/f/c/c$e;->g:F

    invoke-virtual {p3, v2, v4}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v2

    iput v2, v3, Lb/f/c/c$e;->g:F

    goto/16 :goto_467

    .line 241
    :pswitch_21e
    iget-object v3, p2, Lb/f/c/c$a;->e:Lb/f/c/c$e;

    iget v4, v3, Lb/f/c/c$e;->f:F

    invoke-virtual {p3, v2, v4}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    iput v2, v3, Lb/f/c/c$e;->f:F

    goto/16 :goto_467

    .line 242
    :pswitch_22a
    iget-object v3, p2, Lb/f/c/c$a;->e:Lb/f/c/c$e;

    iget v4, v3, Lb/f/c/c$e;->e:F

    invoke-virtual {p3, v2, v4}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    iput v2, v3, Lb/f/c/c$e;->e:F

    goto/16 :goto_467

    .line 243
    :pswitch_236
    iget-object v3, p2, Lb/f/c/c$a;->e:Lb/f/c/c$e;

    iget v4, v3, Lb/f/c/c$e;->d:F

    invoke-virtual {p3, v2, v4}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    iput v2, v3, Lb/f/c/c$e;->d:F

    goto/16 :goto_467

    .line 244
    :pswitch_242
    iget-object v3, p2, Lb/f/c/c$a;->e:Lb/f/c/c$e;

    iget v4, v3, Lb/f/c/c$e;->c:F

    invoke-virtual {p3, v2, v4}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    iput v2, v3, Lb/f/c/c$e;->c:F

    goto/16 :goto_467

    .line 245
    :pswitch_24e
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v3, v7, :cond_467

    .line 246
    iget-object v3, p2, Lb/f/c/c$a;->e:Lb/f/c/c$e;

    iput-boolean v4, v3, Lb/f/c/c$e;->l:Z

    .line 247
    iget v4, v3, Lb/f/c/c$e;->m:F

    invoke-virtual {p3, v2, v4}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v2

    iput v2, v3, Lb/f/c/c$e;->m:F

    goto/16 :goto_467

    .line 248
    :pswitch_260
    iget-object v3, p2, Lb/f/c/c$a;->b:Lb/f/c/c$d;

    iget v4, v3, Lb/f/c/c$d;->d:F

    invoke-virtual {p3, v2, v4}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    iput v2, v3, Lb/f/c/c$d;->d:F

    goto/16 :goto_467

    .line 249
    :pswitch_26c
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v4, v3, Lb/f/c/c$b;->S:I

    invoke-virtual {p3, v2, v4}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, v3, Lb/f/c/c$b;->S:I

    goto/16 :goto_467

    .line 250
    :pswitch_278
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v4, v3, Lb/f/c/c$b;->R:I

    invoke-virtual {p3, v2, v4}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, v3, Lb/f/c/c$b;->R:I

    goto/16 :goto_467

    .line 251
    :pswitch_284
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v4, v3, Lb/f/c/c$b;->P:F

    invoke-virtual {p3, v2, v4}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    iput v2, v3, Lb/f/c/c$b;->P:F

    goto/16 :goto_467

    .line 252
    :pswitch_290
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v4, v3, Lb/f/c/c$b;->Q:F

    invoke-virtual {p3, v2, v4}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    iput v2, v3, Lb/f/c/c$b;->Q:F

    goto/16 :goto_467

    .line 253
    :pswitch_29c
    iget v3, p2, Lb/f/c/c$a;->a:I

    invoke-virtual {p3, v2, v3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    iput v2, p2, Lb/f/c/c$a;->a:I

    goto/16 :goto_467

    .line 254
    :pswitch_2a6
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v4, v3, Lb/f/c/c$b;->v:F

    invoke-virtual {p3, v2, v4}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    iput v2, v3, Lb/f/c/c$b;->v:F

    goto/16 :goto_467

    .line 255
    :pswitch_2b2
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v4, v3, Lb/f/c/c$b;->l:I

    invoke-static {p3, v2, v4}, Lb/f/c/c;->b(Landroid/content/res/TypedArray;II)I

    move-result v2

    iput v2, v3, Lb/f/c/c$b;->l:I

    goto/16 :goto_467

    .line 256
    :pswitch_2be
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v4, v3, Lb/f/c/c$b;->m:I

    invoke-static {p3, v2, v4}, Lb/f/c/c;->b(Landroid/content/res/TypedArray;II)I

    move-result v2

    iput v2, v3, Lb/f/c/c$b;->m:I

    goto/16 :goto_467

    .line 257
    :pswitch_2ca
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v4, v3, Lb/f/c/c$b;->F:I

    invoke-virtual {p3, v2, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, v3, Lb/f/c/c$b;->F:I

    goto/16 :goto_467

    .line 258
    :pswitch_2d6
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v4, v3, Lb/f/c/c$b;->r:I

    invoke-static {p3, v2, v4}, Lb/f/c/c;->b(Landroid/content/res/TypedArray;II)I

    move-result v2

    iput v2, v3, Lb/f/c/c$b;->r:I

    goto/16 :goto_467

    .line 259
    :pswitch_2e2
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v4, v3, Lb/f/c/c$b;->q:I

    invoke-static {p3, v2, v4}, Lb/f/c/c;->b(Landroid/content/res/TypedArray;II)I

    move-result v2

    iput v2, v3, Lb/f/c/c$b;->q:I

    goto/16 :goto_467

    .line 260
    :pswitch_2ee
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v3, v8, :cond_467

    .line 261
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v4, v3, Lb/f/c/c$b;->I:I

    invoke-virtual {p3, v2, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, v3, Lb/f/c/c$b;->I:I

    goto/16 :goto_467

    .line 262
    :pswitch_2fe
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v4, v3, Lb/f/c/c$b;->k:I

    invoke-static {p3, v2, v4}, Lb/f/c/c;->b(Landroid/content/res/TypedArray;II)I

    move-result v2

    iput v2, v3, Lb/f/c/c$b;->k:I

    goto/16 :goto_467

    .line 263
    :pswitch_30a
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v4, v3, Lb/f/c/c$b;->j:I

    invoke-static {p3, v2, v4}, Lb/f/c/c;->b(Landroid/content/res/TypedArray;II)I

    move-result v2

    iput v2, v3, Lb/f/c/c$b;->j:I

    goto/16 :goto_467

    .line 264
    :pswitch_316
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v4, v3, Lb/f/c/c$b;->E:I

    invoke-virtual {p3, v2, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, v3, Lb/f/c/c$b;->E:I

    goto/16 :goto_467

    .line 265
    :pswitch_322
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v4, v3, Lb/f/c/c$b;->C:I

    invoke-virtual {p3, v2, v4}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, v3, Lb/f/c/c$b;->C:I

    goto/16 :goto_467

    .line 266
    :pswitch_32e
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v4, v3, Lb/f/c/c$b;->i:I

    invoke-static {p3, v2, v4}, Lb/f/c/c;->b(Landroid/content/res/TypedArray;II)I

    move-result v2

    iput v2, v3, Lb/f/c/c$b;->i:I

    goto/16 :goto_467

    .line 267
    :pswitch_33a
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v4, v3, Lb/f/c/c$b;->h:I

    invoke-static {p3, v2, v4}, Lb/f/c/c;->b(Landroid/content/res/TypedArray;II)I

    move-result v2

    iput v2, v3, Lb/f/c/c$b;->h:I

    goto/16 :goto_467

    .line 268
    :pswitch_346
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v4, v3, Lb/f/c/c$b;->D:I

    invoke-virtual {p3, v2, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, v3, Lb/f/c/c$b;->D:I

    goto/16 :goto_467

    .line 269
    :pswitch_352
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v4, v3, Lb/f/c/c$b;->c:I

    invoke-virtual {p3, v2, v4}, Landroid/content/res/TypedArray;->getLayoutDimension(II)I

    move-result v2

    iput v2, v3, Lb/f/c/c$b;->c:I

    goto/16 :goto_467

    .line 270
    :pswitch_35e
    iget-object v3, p2, Lb/f/c/c$a;->b:Lb/f/c/c$d;

    iget v4, v3, Lb/f/c/c$d;->b:I

    invoke-virtual {p3, v2, v4}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, v3, Lb/f/c/c$d;->b:I

    .line 271
    iget-object v2, p2, Lb/f/c/c$a;->b:Lb/f/c/c$d;

    sget-object v3, Lb/f/c/c;->d:[I

    iget v4, v2, Lb/f/c/c$d;->b:I

    aget v3, v3, v4

    iput v3, v2, Lb/f/c/c$d;->b:I

    goto/16 :goto_467

    .line 272
    :pswitch_374
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v4, v3, Lb/f/c/c$b;->d:I

    invoke-virtual {p3, v2, v4}, Landroid/content/res/TypedArray;->getLayoutDimension(II)I

    move-result v2

    iput v2, v3, Lb/f/c/c$b;->d:I

    goto/16 :goto_467

    .line 273
    :pswitch_380
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v4, v3, Lb/f/c/c$b;->u:F

    invoke-virtual {p3, v2, v4}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    iput v2, v3, Lb/f/c/c$b;->u:F

    goto/16 :goto_467

    .line 274
    :pswitch_38c
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v4, v3, Lb/f/c/c$b;->g:F

    invoke-virtual {p3, v2, v4}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    iput v2, v3, Lb/f/c/c$b;->g:F

    goto/16 :goto_467

    .line 275
    :pswitch_398
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v4, v3, Lb/f/c/c$b;->f:I

    invoke-virtual {p3, v2, v4}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v2

    iput v2, v3, Lb/f/c/c$b;->f:I

    goto/16 :goto_467

    .line 276
    :pswitch_3a4
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v4, v3, Lb/f/c/c$b;->e:I

    invoke-virtual {p3, v2, v4}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v2

    iput v2, v3, Lb/f/c/c$b;->e:I

    goto/16 :goto_467

    .line 277
    :pswitch_3b0
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v4, v3, Lb/f/c/c$b;->K:I

    invoke-virtual {p3, v2, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, v3, Lb/f/c/c$b;->K:I

    goto/16 :goto_467

    .line 278
    :pswitch_3bc
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v4, v3, Lb/f/c/c$b;->O:I

    invoke-virtual {p3, v2, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, v3, Lb/f/c/c$b;->O:I

    goto/16 :goto_467

    .line 279
    :pswitch_3c8
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v4, v3, Lb/f/c/c$b;->L:I

    invoke-virtual {p3, v2, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, v3, Lb/f/c/c$b;->L:I

    goto/16 :goto_467

    .line 280
    :pswitch_3d4
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v4, v3, Lb/f/c/c$b;->J:I

    invoke-virtual {p3, v2, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, v3, Lb/f/c/c$b;->J:I

    goto/16 :goto_467

    .line 281
    :pswitch_3e0
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v4, v3, Lb/f/c/c$b;->N:I

    invoke-virtual {p3, v2, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, v3, Lb/f/c/c$b;->N:I

    goto/16 :goto_467

    .line 282
    :pswitch_3ec
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v4, v3, Lb/f/c/c$b;->M:I

    invoke-virtual {p3, v2, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, v3, Lb/f/c/c$b;->M:I

    goto/16 :goto_467

    .line 283
    :pswitch_3f8
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v4, v3, Lb/f/c/c$b;->s:I

    invoke-static {p3, v2, v4}, Lb/f/c/c;->b(Landroid/content/res/TypedArray;II)I

    move-result v2

    iput v2, v3, Lb/f/c/c$b;->s:I

    goto :goto_467

    .line 284
    :pswitch_403
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v4, v3, Lb/f/c/c$b;->t:I

    invoke-static {p3, v2, v4}, Lb/f/c/c;->b(Landroid/content/res/TypedArray;II)I

    move-result v2

    iput v2, v3, Lb/f/c/c$b;->t:I

    goto :goto_467

    .line 285
    :pswitch_40e
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v3, v8, :cond_467

    .line 286
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v4, v3, Lb/f/c/c$b;->H:I

    invoke-virtual {p3, v2, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, v3, Lb/f/c/c$b;->H:I

    goto :goto_467

    .line 287
    :pswitch_41d
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v4, v3, Lb/f/c/c$b;->B:I

    invoke-virtual {p3, v2, v4}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v2

    iput v2, v3, Lb/f/c/c$b;->B:I

    goto :goto_467

    .line 288
    :pswitch_428
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v4, v3, Lb/f/c/c$b;->A:I

    invoke-virtual {p3, v2, v4}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v2

    iput v2, v3, Lb/f/c/c$b;->A:I

    goto :goto_467

    .line 289
    :pswitch_433
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    invoke-virtual {p3, v2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v3, Lb/f/c/c$b;->w:Ljava/lang/String;

    goto :goto_467

    .line 290
    :pswitch_43c
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v4, v3, Lb/f/c/c$b;->n:I

    invoke-static {p3, v2, v4}, Lb/f/c/c;->b(Landroid/content/res/TypedArray;II)I

    move-result v2

    iput v2, v3, Lb/f/c/c$b;->n:I

    goto :goto_467

    .line 291
    :pswitch_447
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v4, v3, Lb/f/c/c$b;->o:I

    invoke-static {p3, v2, v4}, Lb/f/c/c;->b(Landroid/content/res/TypedArray;II)I

    move-result v2

    iput v2, v3, Lb/f/c/c$b;->o:I

    goto :goto_467

    .line 292
    :pswitch_452
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v4, v3, Lb/f/c/c$b;->G:I

    invoke-virtual {p3, v2, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, v3, Lb/f/c/c$b;->G:I

    goto :goto_467

    .line 293
    :pswitch_45d
    iget-object v3, p2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v4, v3, Lb/f/c/c$b;->p:I

    invoke-static {p3, v2, v4}, Lb/f/c/c;->b(Landroid/content/res/TypedArray;II)I

    move-result v2

    iput v2, v3, Lb/f/c/c$b;->p:I

    :cond_467
    :goto_467
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_6

    :cond_46b
    return-void

    :pswitch_data_46c
    .packed-switch 0x1
        :pswitch_45d
        :pswitch_452
        :pswitch_447
        :pswitch_43c
        :pswitch_433
        :pswitch_428
        :pswitch_41d
        :pswitch_40e
        :pswitch_403
        :pswitch_3f8
        :pswitch_3ec
        :pswitch_3e0
        :pswitch_3d4
        :pswitch_3c8
        :pswitch_3bc
        :pswitch_3b0
        :pswitch_3a4
        :pswitch_398
        :pswitch_38c
        :pswitch_380
        :pswitch_374
        :pswitch_35e
        :pswitch_352
        :pswitch_346
        :pswitch_33a
        :pswitch_32e
        :pswitch_322
        :pswitch_316
        :pswitch_30a
        :pswitch_2fe
        :pswitch_2ee
        :pswitch_2e2
        :pswitch_2d6
        :pswitch_2ca
        :pswitch_2be
        :pswitch_2b2
        :pswitch_2a6
        :pswitch_29c
        :pswitch_290
        :pswitch_284
        :pswitch_278
        :pswitch_26c
        :pswitch_260
        :pswitch_24e
        :pswitch_242
        :pswitch_236
        :pswitch_22a
        :pswitch_21e
        :pswitch_212
        :pswitch_206
        :pswitch_1fa
        :pswitch_1ee
        :pswitch_1de
        :pswitch_1d2
        :pswitch_1c6
        :pswitch_1ba
        :pswitch_1ae
        :pswitch_1a2
        :pswitch_196
        :pswitch_18a
        :pswitch_17e
        :pswitch_172
        :pswitch_166
        :pswitch_15a
        :pswitch_139
        :pswitch_12f
        :pswitch_123
        :pswitch_117
        :pswitch_10d
        :pswitch_103
        :pswitch_fc
        :pswitch_f0
        :pswitch_e4
        :pswitch_da
        :pswitch_ce
        :pswitch_c2
        :pswitch_b8
        :pswitch_ac
        :pswitch_a0
        :pswitch_94
        :pswitch_88
        :pswitch_62
    .end packed-switch
.end method

.method public a(Landroid/content/Context;Lorg/xmlpull/v1/XmlPullParser;)V
    .registers 12

    .line 159
    :try_start_0
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v0
    :try_end_4
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_4} :catch_186
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_4} :catch_181

    const/4 v1, 0x0

    move-object v2, v1

    :goto_6
    const/4 v3, 0x1

    if-eq v0, v3, :cond_18a

    if-eqz v0, :cond_178

    const-string v4, "Constraint"

    const/4 v5, 0x3

    const/4 v6, 0x2

    if-eq v0, v6, :cond_36

    if-eq v0, v5, :cond_15

    goto/16 :goto_17b

    .line 160
    :cond_15
    :try_start_15
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v3, "ConstraintSet"

    .line 161
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_22

    return-void

    .line 162
    :cond_22
    invoke-virtual {v0, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_17b

    .line 163
    iget-object v0, p0, Lb/f/c/c;->c:Ljava/util/HashMap;

    iget v3, v2, Lb/f/c/c$a;->a:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v2, v1

    goto/16 :goto_17b

    .line 164
    :cond_36
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v0

    const/4 v7, -0x1

    .line 165
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v8

    sparse-switch v8, :sswitch_data_18c

    goto :goto_90

    :sswitch_43
    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_90

    const/4 v5, 0x0

    goto :goto_91

    :sswitch_4b
    const-string v4, "CustomAttribute"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_90

    const/4 v5, 0x7

    goto :goto_91

    :sswitch_55
    const-string v4, "Barrier"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_90

    const/4 v5, 0x2

    goto :goto_91

    :sswitch_5f
    const-string v4, "Guideline"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_90

    const/4 v5, 0x1

    goto :goto_91

    :sswitch_69
    const-string v4, "Transform"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_90

    const/4 v5, 0x4

    goto :goto_91

    :sswitch_73
    const-string v4, "PropertySet"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_90

    goto :goto_91

    :sswitch_7c
    const-string v4, "Motion"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_90

    const/4 v5, 0x6

    goto :goto_91

    :sswitch_86
    const-string v4, "Layout"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0
    :try_end_8c
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_15 .. :try_end_8c} :catch_186
    .catch Ljava/io/IOException; {:try_start_15 .. :try_end_8c} :catch_181

    if-eqz v0, :cond_90

    const/4 v5, 0x5

    goto :goto_91

    :cond_90
    :goto_90
    const/4 v5, -0x1

    :goto_91
    const-string v0, "XML parser error must be within a Constraint "

    packed-switch v5, :pswitch_data_1ae

    goto/16 :goto_17b

    :pswitch_98
    if-eqz v2, :cond_a1

    .line 166
    :try_start_9a
    iget-object v0, v2, Lb/f/c/c$a;->f:Ljava/util/HashMap;

    invoke-static {p1, p2, v0}, Lb/f/c/a;->a(Landroid/content/Context;Lorg/xmlpull/v1/XmlPullParser;Ljava/util/HashMap;)V

    goto/16 :goto_17b

    .line 167
    :cond_a1
    new-instance p1, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getLineNumber()I

    move-result p2

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    :pswitch_ba
    if-eqz v2, :cond_c7

    .line 168
    iget-object v0, v2, Lb/f/c/c$a;->c:Lb/f/c/c$c;

    invoke-static {p2}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    move-result-object v3

    invoke-virtual {v0, p1, v3}, Lb/f/c/c$c;->a(Landroid/content/Context;Landroid/util/AttributeSet;)V

    goto/16 :goto_17b

    .line 169
    :cond_c7
    new-instance p1, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getLineNumber()I

    move-result p2

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    :pswitch_e0
    if-eqz v2, :cond_ed

    .line 170
    iget-object v0, v2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    invoke-static {p2}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    move-result-object v3

    invoke-virtual {v0, p1, v3}, Lb/f/c/c$b;->a(Landroid/content/Context;Landroid/util/AttributeSet;)V

    goto/16 :goto_17b

    .line 171
    :cond_ed
    new-instance p1, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getLineNumber()I

    move-result p2

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    :pswitch_106
    if-eqz v2, :cond_112

    .line 172
    iget-object v0, v2, Lb/f/c/c$a;->e:Lb/f/c/c$e;

    invoke-static {p2}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    move-result-object v3

    invoke-virtual {v0, p1, v3}, Lb/f/c/c$e;->a(Landroid/content/Context;Landroid/util/AttributeSet;)V

    goto :goto_17b

    .line 173
    :cond_112
    new-instance p1, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getLineNumber()I

    move-result p2

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    :pswitch_12b
    if-eqz v2, :cond_137

    .line 174
    iget-object v0, v2, Lb/f/c/c$a;->b:Lb/f/c/c$d;

    invoke-static {p2}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    move-result-object v3

    invoke-virtual {v0, p1, v3}, Lb/f/c/c$d;->a(Landroid/content/Context;Landroid/util/AttributeSet;)V

    goto :goto_17b

    .line 175
    :cond_137
    new-instance p1, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getLineNumber()I

    move-result p2

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 176
    :pswitch_150
    invoke-static {p2}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lb/f/c/c;->a(Landroid/content/Context;Landroid/util/AttributeSet;)Lb/f/c/c$a;

    move-result-object v0

    .line 177
    iget-object v2, v0, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iput v3, v2, Lb/f/c/c$b;->d0:I

    goto :goto_176

    .line 178
    :pswitch_15d
    invoke-static {p2}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lb/f/c/c;->a(Landroid/content/Context;Landroid/util/AttributeSet;)Lb/f/c/c$a;

    move-result-object v0

    .line 179
    iget-object v2, v0, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iput-boolean v3, v2, Lb/f/c/c$b;->a:Z

    .line 180
    iget-object v2, v0, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iput-boolean v3, v2, Lb/f/c/c$b;->b:Z

    goto :goto_176

    .line 181
    :pswitch_16e
    invoke-static {p2}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lb/f/c/c;->a(Landroid/content/Context;Landroid/util/AttributeSet;)Lb/f/c/c$a;

    move-result-object v0

    :goto_176
    move-object v2, v0

    goto :goto_17b

    .line 182
    :cond_178
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 183
    :cond_17b
    :goto_17b
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v0
    :try_end_17f
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_9a .. :try_end_17f} :catch_186
    .catch Ljava/io/IOException; {:try_start_9a .. :try_end_17f} :catch_181

    goto/16 :goto_6

    :catch_181
    move-exception p1

    .line 184
    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_18a

    :catch_186
    move-exception p1

    .line 185
    invoke-virtual {p1}, Lorg/xmlpull/v1/XmlPullParserException;->printStackTrace()V

    :cond_18a
    :goto_18a
    return-void

    nop

    :sswitch_data_18c
    .sparse-switch
        -0x78c018b6 -> :sswitch_86
        -0x7648542a -> :sswitch_7c
        -0x4bab3dd3 -> :sswitch_73
        -0x49cf74b4 -> :sswitch_69
        -0x446d330 -> :sswitch_5f
        0x4f5d3b97 -> :sswitch_55
        0x6acd460b -> :sswitch_4b
        0x6b78f1fd -> :sswitch_43
    .end sparse-switch

    :pswitch_data_1ae
    .packed-switch 0x0
        :pswitch_16e
        :pswitch_15d
        :pswitch_150
        :pswitch_12b
        :pswitch_106
        :pswitch_e0
        :pswitch_ba
        :pswitch_98
    .end packed-switch
.end method

.method public a(Landroidx/constraintlayout/widget/ConstraintHelper;Lb/f/b/k/e;Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;Landroid/util/SparseArray;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/constraintlayout/widget/ConstraintHelper;",
            "Lb/f/b/k/e;",
            "Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;",
            "Landroid/util/SparseArray<",
            "Lb/f/b/k/e;",
            ">;)V"
        }
    .end annotation

    .line 44
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    .line 45
    iget-object v1, p0, Lb/f/c/c;->c:Ljava/util/HashMap;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_25

    .line 46
    iget-object v1, p0, Lb/f/c/c;->c:Ljava/util/HashMap;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/f/c/c$a;

    .line 47
    instance-of v1, p2, Lb/f/b/k/j;

    if-eqz v1, :cond_25

    .line 48
    check-cast p2, Lb/f/b/k/j;

    .line 49
    invoke-virtual {p1, v0, p2, p3, p4}, Landroidx/constraintlayout/widget/ConstraintHelper;->a(Lb/f/c/c$a;Lb/f/b/k/j;Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;Landroid/util/SparseArray;)V

    :cond_25
    return-void
.end method

.method public a(Landroidx/constraintlayout/widget/ConstraintLayout;)V
    .registers 8

    .line 34
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_5
    if-ge v1, v0, :cond_66

    .line 35
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 36
    invoke-virtual {v2}, Landroid/view/View;->getId()I

    move-result v3

    .line 37
    iget-object v4, p0, Lb/f/c/c;->c:Ljava/util/HashMap;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_36

    .line 38
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "id unknown "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v2}, Lb/f/a/b/a;->a(Landroid/view/View;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "ConstraintSet"

    invoke-static {v3, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_63

    .line 39
    :cond_36
    iget-boolean v4, p0, Lb/f/c/c;->b:Z

    if-eqz v4, :cond_46

    const/4 v4, -0x1

    if-eq v3, v4, :cond_3e

    goto :goto_46

    .line 40
    :cond_3e
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "All children of ConstraintLayout must have ids to use ConstraintSet"

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 41
    :cond_46
    :goto_46
    iget-object v4, p0, Lb/f/c/c;->c:Ljava/util/HashMap;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_63

    .line 42
    iget-object v4, p0, Lb/f/c/c;->c:Ljava/util/HashMap;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lb/f/c/c$a;

    .line 43
    iget-object v3, v3, Lb/f/c/c$a;->f:Ljava/util/HashMap;

    invoke-static {v2, v3}, Lb/f/c/a;->a(Landroid/view/View;Ljava/util/HashMap;)V

    :cond_63
    :goto_63
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    :cond_66
    return-void
.end method

.method public a(Landroidx/constraintlayout/widget/ConstraintLayout;Z)V
    .registers 13

    .line 53
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    .line 54
    new-instance v1, Ljava/util/HashSet;

    iget-object v2, p0, Lb/f/c/c;->c:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    const/4 v2, 0x0

    :goto_10
    const/4 v3, 0x1

    const/4 v4, -0x1

    if-ge v2, v0, :cond_16f

    .line 55
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 56
    invoke-virtual {v5}, Landroid/view/View;->getId()I

    move-result v6

    .line 57
    iget-object v7, p0, Lb/f/c/c;->c:Ljava/util/HashMap;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    const-string v8, "ConstraintSet"

    if-nez v7, :cond_44

    .line 58
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "id unknown "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v5}, Lb/f/a/b/a;->a(Landroid/view/View;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v8, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_16b

    .line 59
    :cond_44
    iget-boolean v7, p0, Lb/f/c/c;->b:Z

    if-eqz v7, :cond_53

    if-eq v6, v4, :cond_4b

    goto :goto_53

    .line 60
    :cond_4b
    new-instance p1, Ljava/lang/RuntimeException;

    const-string p2, "All children of ConstraintLayout must have ids to use ConstraintSet"

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_53
    :goto_53
    if-ne v6, v4, :cond_57

    goto/16 :goto_16b

    .line 61
    :cond_57
    iget-object v7, p0, Lb/f/c/c;->c:Ljava/util/HashMap;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_157

    .line 62
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v1, v7}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 63
    iget-object v7, p0, Lb/f/c/c;->c:Ljava/util/HashMap;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lb/f/c/c$a;

    .line 64
    instance-of v8, v5, Landroidx/constraintlayout/widget/Barrier;

    if-eqz v8, :cond_7e

    .line 65
    iget-object v8, v7, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iput v3, v8, Lb/f/c/c$b;->d0:I

    .line 66
    :cond_7e
    iget-object v8, v7, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v8, v8, Lb/f/c/c$b;->d0:I

    if-eq v8, v4, :cond_bd

    if-eq v8, v3, :cond_87

    goto :goto_bd

    .line 67
    :cond_87
    move-object v3, v5

    check-cast v3, Landroidx/constraintlayout/widget/Barrier;

    .line 68
    invoke-virtual {v3, v6}, Landroid/view/View;->setId(I)V

    .line 69
    iget-object v4, v7, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v4, v4, Lb/f/c/c$b;->b0:I

    invoke-virtual {v3, v4}, Landroidx/constraintlayout/widget/Barrier;->setType(I)V

    .line 70
    iget-object v4, v7, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v4, v4, Lb/f/c/c$b;->c0:I

    invoke-virtual {v3, v4}, Landroidx/constraintlayout/widget/Barrier;->setMargin(I)V

    .line 71
    iget-object v4, v7, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget-boolean v4, v4, Lb/f/c/c$b;->j0:Z

    invoke-virtual {v3, v4}, Landroidx/constraintlayout/widget/Barrier;->setAllowsGoneWidget(Z)V

    .line 72
    iget-object v4, v7, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget-object v6, v4, Lb/f/c/c$b;->e0:[I

    if-eqz v6, :cond_ac

    .line 73
    invoke-virtual {v3, v6}, Landroidx/constraintlayout/widget/ConstraintHelper;->setReferencedIds([I)V

    goto :goto_bd

    .line 74
    :cond_ac
    iget-object v6, v4, Lb/f/c/c$b;->f0:Ljava/lang/String;

    if-eqz v6, :cond_bd

    .line 75
    invoke-virtual {p0, v3, v6}, Lb/f/c/c;->a(Landroid/view/View;Ljava/lang/String;)[I

    move-result-object v6

    iput-object v6, v4, Lb/f/c/c$b;->e0:[I

    .line 76
    iget-object v4, v7, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget-object v4, v4, Lb/f/c/c$b;->e0:[I

    invoke-virtual {v3, v4}, Landroidx/constraintlayout/widget/ConstraintHelper;->setReferencedIds([I)V

    .line 77
    :cond_bd
    :goto_bd
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;

    .line 78
    invoke-virtual {v3}, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->c()V

    .line 79
    invoke-virtual {v7, v3}, Lb/f/c/c$a;->a(Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;)V

    if-eqz p2, :cond_d0

    .line 80
    iget-object v4, v7, Lb/f/c/c$a;->f:Ljava/util/HashMap;

    invoke-static {v5, v4}, Lb/f/c/a;->a(Landroid/view/View;Ljava/util/HashMap;)V

    .line 81
    :cond_d0
    invoke-virtual {v5, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 82
    iget-object v3, v7, Lb/f/c/c$a;->b:Lb/f/c/c$d;

    iget v4, v3, Lb/f/c/c$d;->c:I

    if-nez v4, :cond_de

    .line 83
    iget v3, v3, Lb/f/c/c$d;->b:I

    invoke-virtual {v5, v3}, Landroid/view/View;->setVisibility(I)V

    .line 84
    :cond_de
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x11

    if-lt v3, v4, :cond_16b

    .line 85
    iget-object v3, v7, Lb/f/c/c$a;->b:Lb/f/c/c$d;

    iget v3, v3, Lb/f/c/c$d;->d:F

    invoke-virtual {v5, v3}, Landroid/view/View;->setAlpha(F)V

    .line 86
    iget-object v3, v7, Lb/f/c/c$a;->e:Lb/f/c/c$e;

    iget v3, v3, Lb/f/c/c$e;->b:F

    invoke-virtual {v5, v3}, Landroid/view/View;->setRotation(F)V

    .line 87
    iget-object v3, v7, Lb/f/c/c$a;->e:Lb/f/c/c$e;

    iget v3, v3, Lb/f/c/c$e;->c:F

    invoke-virtual {v5, v3}, Landroid/view/View;->setRotationX(F)V

    .line 88
    iget-object v3, v7, Lb/f/c/c$a;->e:Lb/f/c/c$e;

    iget v3, v3, Lb/f/c/c$e;->d:F

    invoke-virtual {v5, v3}, Landroid/view/View;->setRotationY(F)V

    .line 89
    iget-object v3, v7, Lb/f/c/c$a;->e:Lb/f/c/c$e;

    iget v3, v3, Lb/f/c/c$e;->e:F

    invoke-virtual {v5, v3}, Landroid/view/View;->setScaleX(F)V

    .line 90
    iget-object v3, v7, Lb/f/c/c$a;->e:Lb/f/c/c$e;

    iget v3, v3, Lb/f/c/c$e;->f:F

    invoke-virtual {v5, v3}, Landroid/view/View;->setScaleY(F)V

    .line 91
    iget-object v3, v7, Lb/f/c/c$a;->e:Lb/f/c/c$e;

    iget v3, v3, Lb/f/c/c$e;->g:F

    invoke-static {v3}, Ljava/lang/Float;->isNaN(F)Z

    move-result v3

    if-nez v3, :cond_11f

    .line 92
    iget-object v3, v7, Lb/f/c/c$a;->e:Lb/f/c/c$e;

    iget v3, v3, Lb/f/c/c$e;->g:F

    invoke-virtual {v5, v3}, Landroid/view/View;->setPivotX(F)V

    .line 93
    :cond_11f
    iget-object v3, v7, Lb/f/c/c$a;->e:Lb/f/c/c$e;

    iget v3, v3, Lb/f/c/c$e;->h:F

    invoke-static {v3}, Ljava/lang/Float;->isNaN(F)Z

    move-result v3

    if-nez v3, :cond_130

    .line 94
    iget-object v3, v7, Lb/f/c/c$a;->e:Lb/f/c/c$e;

    iget v3, v3, Lb/f/c/c$e;->h:F

    invoke-virtual {v5, v3}, Landroid/view/View;->setPivotY(F)V

    .line 95
    :cond_130
    iget-object v3, v7, Lb/f/c/c$a;->e:Lb/f/c/c$e;

    iget v3, v3, Lb/f/c/c$e;->i:F

    invoke-virtual {v5, v3}, Landroid/view/View;->setTranslationX(F)V

    .line 96
    iget-object v3, v7, Lb/f/c/c$a;->e:Lb/f/c/c$e;

    iget v3, v3, Lb/f/c/c$e;->j:F

    invoke-virtual {v5, v3}, Landroid/view/View;->setTranslationY(F)V

    .line 97
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x15

    if-lt v3, v4, :cond_16b

    .line 98
    iget-object v3, v7, Lb/f/c/c$a;->e:Lb/f/c/c$e;

    iget v3, v3, Lb/f/c/c$e;->k:F

    invoke-virtual {v5, v3}, Landroid/view/View;->setTranslationZ(F)V

    .line 99
    iget-object v3, v7, Lb/f/c/c$a;->e:Lb/f/c/c$e;

    iget-boolean v4, v3, Lb/f/c/c$e;->l:Z

    if-eqz v4, :cond_16b

    .line 100
    iget v3, v3, Lb/f/c/c$e;->m:F

    invoke-virtual {v5, v3}, Landroid/view/View;->setElevation(F)V

    goto :goto_16b

    .line 101
    :cond_157
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "WARNING NO CONSTRAINTS for view "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v8, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_16b
    :goto_16b
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_10

    .line 102
    :cond_16f
    invoke-virtual {v1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_173
    :goto_173
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1f8

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 103
    iget-object v1, p0, Lb/f/c/c;->c:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/f/c/c$a;

    .line 104
    iget-object v2, v1, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v2, v2, Lb/f/c/c$b;->d0:I

    if-eq v2, v4, :cond_1d6

    if-eq v2, v3, :cond_190

    goto :goto_1d6

    .line 105
    :cond_190
    new-instance v2, Landroidx/constraintlayout/widget/Barrier;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v2, v5}, Landroidx/constraintlayout/widget/Barrier;-><init>(Landroid/content/Context;)V

    .line 106
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual {v2, v5}, Landroid/view/View;->setId(I)V

    .line 107
    iget-object v5, v1, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget-object v6, v5, Lb/f/c/c$b;->e0:[I

    if-eqz v6, :cond_1aa

    .line 108
    invoke-virtual {v2, v6}, Landroidx/constraintlayout/widget/ConstraintHelper;->setReferencedIds([I)V

    goto :goto_1bb

    .line 109
    :cond_1aa
    iget-object v6, v5, Lb/f/c/c$b;->f0:Ljava/lang/String;

    if-eqz v6, :cond_1bb

    .line 110
    invoke-virtual {p0, v2, v6}, Lb/f/c/c;->a(Landroid/view/View;Ljava/lang/String;)[I

    move-result-object v6

    iput-object v6, v5, Lb/f/c/c$b;->e0:[I

    .line 111
    iget-object v5, v1, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget-object v5, v5, Lb/f/c/c$b;->e0:[I

    invoke-virtual {v2, v5}, Landroidx/constraintlayout/widget/ConstraintHelper;->setReferencedIds([I)V

    .line 112
    :cond_1bb
    :goto_1bb
    iget-object v5, v1, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v5, v5, Lb/f/c/c$b;->b0:I

    invoke-virtual {v2, v5}, Landroidx/constraintlayout/widget/Barrier;->setType(I)V

    .line 113
    iget-object v5, v1, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget v5, v5, Lb/f/c/c$b;->c0:I

    invoke-virtual {v2, v5}, Landroidx/constraintlayout/widget/Barrier;->setMargin(I)V

    .line 114
    invoke-virtual {p1}, Landroidx/constraintlayout/widget/ConstraintLayout;->generateDefaultLayoutParams()Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;

    move-result-object v5

    .line 115
    invoke-virtual {v2}, Landroidx/constraintlayout/widget/ConstraintHelper;->b()V

    .line 116
    invoke-virtual {v1, v5}, Lb/f/c/c$a;->a(Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;)V

    .line 117
    invoke-virtual {p1, v2, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 118
    :cond_1d6
    :goto_1d6
    iget-object v2, v1, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget-boolean v2, v2, Lb/f/c/c$b;->a:Z

    if-eqz v2, :cond_173

    .line 119
    new-instance v2, Landroidx/constraintlayout/widget/Guideline;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v2, v5}, Landroidx/constraintlayout/widget/Guideline;-><init>(Landroid/content/Context;)V

    .line 120
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {v2, v0}, Landroid/view/View;->setId(I)V

    .line 121
    invoke-virtual {p1}, Landroidx/constraintlayout/widget/ConstraintLayout;->generateDefaultLayoutParams()Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;

    move-result-object v0

    .line 122
    invoke-virtual {v1, v0}, Lb/f/c/c$a;->a(Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;)V

    .line 123
    invoke-virtual {p1, v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto/16 :goto_173

    :cond_1f8
    return-void
.end method

.method public a(Landroidx/constraintlayout/widget/Constraints;)V
    .registers 10

    .line 20
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    .line 21
    iget-object v1, p0, Lb/f/c/c;->c:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->clear()V

    const/4 v1, 0x0

    :goto_a
    if-ge v1, v0, :cond_5f

    .line 22
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 23
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroidx/constraintlayout/widget/Constraints$LayoutParams;

    .line 24
    invoke-virtual {v2}, Landroid/view/View;->getId()I

    move-result v4

    .line 25
    iget-boolean v5, p0, Lb/f/c/c;->b:Z

    if-eqz v5, :cond_2a

    const/4 v5, -0x1

    if-eq v4, v5, :cond_22

    goto :goto_2a

    .line 26
    :cond_22
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "All children of ConstraintLayout must have ids to use ConstraintSet"

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 27
    :cond_2a
    :goto_2a
    iget-object v5, p0, Lb/f/c/c;->c:Ljava/util/HashMap;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_44

    .line 28
    iget-object v5, p0, Lb/f/c/c;->c:Ljava/util/HashMap;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    new-instance v7, Lb/f/c/c$a;

    invoke-direct {v7}, Lb/f/c/c$a;-><init>()V

    invoke-virtual {v5, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    :cond_44
    iget-object v5, p0, Lb/f/c/c;->c:Ljava/util/HashMap;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lb/f/c/c$a;

    .line 30
    instance-of v6, v2, Landroidx/constraintlayout/widget/ConstraintHelper;

    if-eqz v6, :cond_59

    .line 31
    check-cast v2, Landroidx/constraintlayout/widget/ConstraintHelper;

    .line 32
    invoke-static {v5, v2, v4, v3}, Lb/f/c/c$a;->a(Lb/f/c/c$a;Landroidx/constraintlayout/widget/ConstraintHelper;ILandroidx/constraintlayout/widget/Constraints$LayoutParams;)V

    .line 33
    :cond_59
    invoke-static {v5, v4, v3}, Lb/f/c/c$a;->a(Lb/f/c/c$a;ILandroidx/constraintlayout/widget/Constraints$LayoutParams;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    :cond_5f
    return-void
.end method

.method public a(Lb/f/c/c;)V
    .registers 9

    .line 2
    iget-object v0, p1, Lb/f/c/c;->c:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_9e

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 3
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 4
    iget-object v3, p1, Lb/f/c/c;->c:Ljava/util/HashMap;

    invoke-virtual {v3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/f/c/c$a;

    .line 5
    iget-object v3, p0, Lb/f/c/c;->c:Ljava/util/HashMap;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3c

    .line 6
    iget-object v3, p0, Lb/f/c/c;->c:Ljava/util/HashMap;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    new-instance v5, Lb/f/c/c$a;

    invoke-direct {v5}, Lb/f/c/c$a;-><init>()V

    invoke-virtual {v3, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    :cond_3c
    iget-object v3, p0, Lb/f/c/c;->c:Ljava/util/HashMap;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/f/c/c$a;

    .line 8
    iget-object v3, v2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget-boolean v4, v3, Lb/f/c/c$b;->b:Z

    if-nez v4, :cond_53

    .line 9
    iget-object v4, v1, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    invoke-virtual {v3, v4}, Lb/f/c/c$b;->a(Lb/f/c/c$b;)V

    .line 10
    :cond_53
    iget-object v3, v2, Lb/f/c/c$a;->b:Lb/f/c/c$d;

    iget-boolean v4, v3, Lb/f/c/c$d;->a:Z

    if-nez v4, :cond_5e

    .line 11
    iget-object v4, v1, Lb/f/c/c$a;->b:Lb/f/c/c$d;

    invoke-virtual {v3, v4}, Lb/f/c/c$d;->a(Lb/f/c/c$d;)V

    .line 12
    :cond_5e
    iget-object v3, v2, Lb/f/c/c$a;->e:Lb/f/c/c$e;

    iget-boolean v4, v3, Lb/f/c/c$e;->a:Z

    if-nez v4, :cond_69

    .line 13
    iget-object v4, v1, Lb/f/c/c$a;->e:Lb/f/c/c$e;

    invoke-virtual {v3, v4}, Lb/f/c/c$e;->a(Lb/f/c/c$e;)V

    .line 14
    :cond_69
    iget-object v3, v2, Lb/f/c/c$a;->c:Lb/f/c/c$c;

    iget-boolean v4, v3, Lb/f/c/c$c;->a:Z

    if-nez v4, :cond_74

    .line 15
    iget-object v4, v1, Lb/f/c/c$a;->c:Lb/f/c/c$c;

    invoke-virtual {v3, v4}, Lb/f/c/c$c;->a(Lb/f/c/c$c;)V

    .line 16
    :cond_74
    iget-object v3, v1, Lb/f/c/c$a;->f:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_7e
    :goto_7e
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_a

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 17
    iget-object v5, v2, Lb/f/c/c$a;->f:Ljava/util/HashMap;

    invoke-virtual {v5, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_7e

    .line 18
    iget-object v5, v2, Lb/f/c/c$a;->f:Ljava/util/HashMap;

    iget-object v6, v1, Lb/f/c/c$a;->f:Ljava/util/HashMap;

    invoke-virtual {v6, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v4, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_7e

    :cond_9e
    return-void
.end method

.method public a(Z)V
    .registers 2

    .line 317
    iput-boolean p1, p0, Lb/f/c/c;->b:Z

    return-void
.end method

.method public a()[I
    .registers 6

    .line 314
    iget-object v0, p0, Lb/f/c/c;->c:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Integer;

    invoke-interface {v0, v2}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Integer;

    .line 315
    array-length v2, v0

    new-array v3, v2, [I

    :goto_12
    if-ge v1, v2, :cond_1f

    .line 316
    aget-object v4, v0, v1

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    aput v4, v3, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_12

    :cond_1f
    return-object v3
.end method

.method public final a(Landroid/view/View;Ljava/lang/String;)[I
    .registers 12

    const-string v0, ","

    .line 294
    invoke-virtual {p2, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p2

    .line 295
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 296
    array-length v1, p2

    new-array v1, v1, [I

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    .line 297
    :goto_10
    array-length v5, p2

    if-ge v3, v5, :cond_64

    .line 298
    aget-object v5, p2, v3

    .line 299
    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    .line 300
    :try_start_19
    const-class v6, Lb/f/c/e;

    .line 301
    invoke-virtual {v6, v5}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v6

    const/4 v7, 0x0

    .line 302
    invoke-virtual {v6, v7}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v6
    :try_end_24
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_24} :catch_25

    goto :goto_26

    :catch_25
    const/4 v6, 0x0

    :goto_26
    if-nez v6, :cond_36

    .line 303
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    .line 304
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v7

    const-string v8, "id"

    .line 305
    invoke-virtual {v6, v5, v8, v7}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v6

    :cond_36
    if-nez v6, :cond_5c

    .line 306
    invoke-virtual {p1}, Landroid/view/View;->isInEditMode()Z

    move-result v7

    if-eqz v7, :cond_5c

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v7

    instance-of v7, v7, Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v7, :cond_5c

    .line 307
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v7

    check-cast v7, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 308
    invoke-virtual {v7, v2, v5}, Landroidx/constraintlayout/widget/ConstraintLayout;->a(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_5c

    .line 309
    instance-of v7, v5, Ljava/lang/Integer;

    if-eqz v7, :cond_5c

    .line 310
    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v6

    :cond_5c
    add-int/lit8 v5, v4, 0x1

    .line 311
    aput v6, v1, v4

    add-int/lit8 v3, v3, 0x1

    move v4, v5

    goto :goto_10

    .line 312
    :cond_64
    array-length p1, p2

    if-eq v4, p1, :cond_6b

    .line 313
    invoke-static {v1, v4}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v1

    :cond_6b
    return-object v1
.end method

.method public b(I)Lb/f/c/c$a;
    .registers 4

    .line 19
    iget-object v0, p0, Lb/f/c/c;->c:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_19

    .line 20
    iget-object v0, p0, Lb/f/c/c;->c:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lb/f/c/c$a;

    return-object p1

    :cond_19
    const/4 p1, 0x0

    return-object p1
.end method

.method public b(Landroid/content/Context;I)V
    .registers 7

    .line 5
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 6
    invoke-virtual {v0, p2}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    move-result-object p2

    .line 7
    :try_start_8
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v0

    :goto_c
    const/4 v1, 0x1

    if-eq v0, v1, :cond_4a

    if-eqz v0, :cond_39

    const/4 v2, 0x2

    if-eq v0, v2, :cond_15

    goto :goto_3c

    .line 8
    :cond_15
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v0

    .line 9
    invoke-static {p2}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    move-result-object v2

    invoke-virtual {p0, p1, v2}, Lb/f/c/c;->a(Landroid/content/Context;Landroid/util/AttributeSet;)Lb/f/c/c$a;

    move-result-object v2

    const-string v3, "Guideline"

    .line 10
    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2d

    .line 11
    iget-object v0, v2, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iput-boolean v1, v0, Lb/f/c/c$b;->a:Z

    .line 12
    :cond_2d
    iget-object v0, p0, Lb/f/c/c;->c:Ljava/util/HashMap;

    iget v1, v2, Lb/f/c/c$a;->a:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3c

    .line 13
    :cond_39
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 14
    :goto_3c
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v0
    :try_end_40
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_8 .. :try_end_40} :catch_46
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_40} :catch_41

    goto :goto_c

    :catch_41
    move-exception p1

    .line 15
    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_4a

    :catch_46
    move-exception p1

    .line 16
    invoke-virtual {p1}, Lorg/xmlpull/v1/XmlPullParserException;->printStackTrace()V

    :cond_4a
    :goto_4a
    return-void
.end method

.method public b(Landroidx/constraintlayout/widget/ConstraintLayout;)V
    .registers 3

    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Lb/f/c/c;->a(Landroidx/constraintlayout/widget/ConstraintLayout;Z)V

    const/4 v0, 0x0

    .line 3
    invoke-virtual {p1, v0}, Landroidx/constraintlayout/widget/ConstraintLayout;->setConstraintSet(Lb/f/c/c;)V

    .line 4
    invoke-virtual {p1}, Landroidx/constraintlayout/widget/ConstraintLayout;->requestLayout()V

    return-void
.end method

.method public b(Z)V
    .registers 2

    return-void
.end method

.method public c(I)I
    .registers 2

    .line 37
    invoke-virtual {p0, p1}, Lb/f/c/c;->a(I)Lb/f/c/c$a;

    move-result-object p1

    iget-object p1, p1, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget p1, p1, Lb/f/c/c$b;->d:I

    return p1
.end method

.method public c(Landroidx/constraintlayout/widget/ConstraintLayout;)V
    .registers 13

    .line 1
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    .line 2
    iget-object v1, p0, Lb/f/c/c;->c:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->clear()V

    const/4 v1, 0x0

    :goto_a
    if-ge v1, v0, :cond_107

    .line 3
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 4
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;

    .line 5
    invoke-virtual {v2}, Landroid/view/View;->getId()I

    move-result v4

    .line 6
    iget-boolean v5, p0, Lb/f/c/c;->b:Z

    if-eqz v5, :cond_2a

    const/4 v5, -0x1

    if-eq v4, v5, :cond_22

    goto :goto_2a

    .line 7
    :cond_22
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "All children of ConstraintLayout must have ids to use ConstraintSet"

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 8
    :cond_2a
    :goto_2a
    iget-object v5, p0, Lb/f/c/c;->c:Ljava/util/HashMap;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_44

    .line 9
    iget-object v5, p0, Lb/f/c/c;->c:Ljava/util/HashMap;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    new-instance v7, Lb/f/c/c$a;

    invoke-direct {v7}, Lb/f/c/c$a;-><init>()V

    invoke-virtual {v5, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    :cond_44
    iget-object v5, p0, Lb/f/c/c;->c:Ljava/util/HashMap;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lb/f/c/c$a;

    .line 11
    iget-object v6, p0, Lb/f/c/c;->a:Ljava/util/HashMap;

    invoke-static {v6, v2}, Lb/f/c/a;->a(Ljava/util/HashMap;Landroid/view/View;)Ljava/util/HashMap;

    move-result-object v6

    iput-object v6, v5, Lb/f/c/c$a;->f:Ljava/util/HashMap;

    .line 12
    invoke-static {v5, v4, v3}, Lb/f/c/c$a;->a(Lb/f/c/c$a;ILandroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;)V

    .line 13
    iget-object v3, v5, Lb/f/c/c$a;->b:Lb/f/c/c$d;

    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v4

    iput v4, v3, Lb/f/c/c$d;->b:I

    .line 14
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x11

    if-lt v3, v4, :cond_dd

    .line 15
    iget-object v3, v5, Lb/f/c/c$a;->b:Lb/f/c/c$d;

    invoke-virtual {v2}, Landroid/view/View;->getAlpha()F

    move-result v4

    iput v4, v3, Lb/f/c/c$d;->d:F

    .line 16
    iget-object v3, v5, Lb/f/c/c$a;->e:Lb/f/c/c$e;

    invoke-virtual {v2}, Landroid/view/View;->getRotation()F

    move-result v4

    iput v4, v3, Lb/f/c/c$e;->b:F

    .line 17
    iget-object v3, v5, Lb/f/c/c$a;->e:Lb/f/c/c$e;

    invoke-virtual {v2}, Landroid/view/View;->getRotationX()F

    move-result v4

    iput v4, v3, Lb/f/c/c$e;->c:F

    .line 18
    iget-object v3, v5, Lb/f/c/c$a;->e:Lb/f/c/c$e;

    invoke-virtual {v2}, Landroid/view/View;->getRotationY()F

    move-result v4

    iput v4, v3, Lb/f/c/c$e;->d:F

    .line 19
    iget-object v3, v5, Lb/f/c/c$a;->e:Lb/f/c/c$e;

    invoke-virtual {v2}, Landroid/view/View;->getScaleX()F

    move-result v4

    iput v4, v3, Lb/f/c/c$e;->e:F

    .line 20
    iget-object v3, v5, Lb/f/c/c$a;->e:Lb/f/c/c$e;

    invoke-virtual {v2}, Landroid/view/View;->getScaleY()F

    move-result v4

    iput v4, v3, Lb/f/c/c$e;->f:F

    .line 21
    invoke-virtual {v2}, Landroid/view/View;->getPivotX()F

    move-result v3

    .line 22
    invoke-virtual {v2}, Landroid/view/View;->getPivotY()F

    move-result v4

    float-to-double v6, v3

    const-wide/16 v8, 0x0

    cmpl-double v10, v6, v8

    if-nez v10, :cond_ad

    float-to-double v6, v4

    cmpl-double v10, v6, v8

    if-eqz v10, :cond_b3

    .line 23
    :cond_ad
    iget-object v6, v5, Lb/f/c/c$a;->e:Lb/f/c/c$e;

    iput v3, v6, Lb/f/c/c$e;->g:F

    .line 24
    iput v4, v6, Lb/f/c/c$e;->h:F

    .line 25
    :cond_b3
    iget-object v3, v5, Lb/f/c/c$a;->e:Lb/f/c/c$e;

    invoke-virtual {v2}, Landroid/view/View;->getTranslationX()F

    move-result v4

    iput v4, v3, Lb/f/c/c$e;->i:F

    .line 26
    iget-object v3, v5, Lb/f/c/c$a;->e:Lb/f/c/c$e;

    invoke-virtual {v2}, Landroid/view/View;->getTranslationY()F

    move-result v4

    iput v4, v3, Lb/f/c/c$e;->j:F

    .line 27
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x15

    if-lt v3, v4, :cond_dd

    .line 28
    iget-object v3, v5, Lb/f/c/c$a;->e:Lb/f/c/c$e;

    invoke-virtual {v2}, Landroid/view/View;->getTranslationZ()F

    move-result v4

    iput v4, v3, Lb/f/c/c$e;->k:F

    .line 29
    iget-object v3, v5, Lb/f/c/c$a;->e:Lb/f/c/c$e;

    iget-boolean v4, v3, Lb/f/c/c$e;->l:Z

    if-eqz v4, :cond_dd

    .line 30
    invoke-virtual {v2}, Landroid/view/View;->getElevation()F

    move-result v4

    iput v4, v3, Lb/f/c/c$e;->m:F

    .line 31
    :cond_dd
    instance-of v3, v2, Landroidx/constraintlayout/widget/Barrier;

    if-eqz v3, :cond_103

    .line 32
    check-cast v2, Landroidx/constraintlayout/widget/Barrier;

    .line 33
    iget-object v3, v5, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    invoke-virtual {v2}, Landroidx/constraintlayout/widget/Barrier;->c()Z

    move-result v4

    iput-boolean v4, v3, Lb/f/c/c$b;->j0:Z

    .line 34
    iget-object v3, v5, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    invoke-virtual {v2}, Landroidx/constraintlayout/widget/ConstraintHelper;->getReferencedIds()[I

    move-result-object v4

    iput-object v4, v3, Lb/f/c/c$b;->e0:[I

    .line 35
    iget-object v3, v5, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    invoke-virtual {v2}, Landroidx/constraintlayout/widget/Barrier;->getType()I

    move-result v4

    iput v4, v3, Lb/f/c/c$b;->b0:I

    .line 36
    iget-object v3, v5, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    invoke-virtual {v2}, Landroidx/constraintlayout/widget/Barrier;->getMargin()I

    move-result v2

    iput v2, v3, Lb/f/c/c$b;->c0:I

    :cond_103
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_a

    :cond_107
    return-void
.end method

.method public d(I)Lb/f/c/c$a;
    .registers 2

    .line 1
    invoke-virtual {p0, p1}, Lb/f/c/c;->a(I)Lb/f/c/c$a;

    move-result-object p1

    return-object p1
.end method

.method public d(Landroidx/constraintlayout/widget/ConstraintLayout;)V
    .registers 13

    .line 2
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_5
    if-ge v1, v0, :cond_11b

    .line 3
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 4
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;

    .line 5
    invoke-virtual {v2}, Landroid/view/View;->getId()I

    move-result v4

    .line 6
    iget-boolean v5, p0, Lb/f/c/c;->b:Z

    if-eqz v5, :cond_25

    const/4 v5, -0x1

    if-eq v4, v5, :cond_1d

    goto :goto_25

    .line 7
    :cond_1d
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "All children of ConstraintLayout must have ids to use ConstraintSet"

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 8
    :cond_25
    :goto_25
    iget-object v5, p0, Lb/f/c/c;->c:Ljava/util/HashMap;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3f

    .line 9
    iget-object v5, p0, Lb/f/c/c;->c:Ljava/util/HashMap;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    new-instance v7, Lb/f/c/c$a;

    invoke-direct {v7}, Lb/f/c/c$a;-><init>()V

    invoke-virtual {v5, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    :cond_3f
    iget-object v5, p0, Lb/f/c/c;->c:Ljava/util/HashMap;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lb/f/c/c$a;

    .line 11
    iget-object v6, v5, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget-boolean v6, v6, Lb/f/c/c$b;->b:Z

    const/4 v7, 0x1

    if-nez v6, :cond_87

    .line 12
    invoke-static {v5, v4, v3}, Lb/f/c/c$a;->a(Lb/f/c/c$a;ILandroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;)V

    .line 13
    instance-of v3, v2, Landroidx/constraintlayout/widget/ConstraintHelper;

    if-eqz v3, :cond_83

    .line 14
    iget-object v3, v5, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    move-object v4, v2

    check-cast v4, Landroidx/constraintlayout/widget/ConstraintHelper;

    invoke-virtual {v4}, Landroidx/constraintlayout/widget/ConstraintHelper;->getReferencedIds()[I

    move-result-object v4

    iput-object v4, v3, Lb/f/c/c$b;->e0:[I

    .line 15
    instance-of v3, v2, Landroidx/constraintlayout/widget/Barrier;

    if-eqz v3, :cond_83

    .line 16
    move-object v3, v2

    check-cast v3, Landroidx/constraintlayout/widget/Barrier;

    .line 17
    iget-object v4, v5, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    invoke-virtual {v3}, Landroidx/constraintlayout/widget/Barrier;->c()Z

    move-result v6

    iput-boolean v6, v4, Lb/f/c/c$b;->j0:Z

    .line 18
    iget-object v4, v5, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    invoke-virtual {v3}, Landroidx/constraintlayout/widget/Barrier;->getType()I

    move-result v6

    iput v6, v4, Lb/f/c/c$b;->b0:I

    .line 19
    iget-object v4, v5, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    invoke-virtual {v3}, Landroidx/constraintlayout/widget/Barrier;->getMargin()I

    move-result v3

    iput v3, v4, Lb/f/c/c$b;->c0:I

    .line 20
    :cond_83
    iget-object v3, v5, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iput-boolean v7, v3, Lb/f/c/c$b;->b:Z

    .line 21
    :cond_87
    iget-object v3, v5, Lb/f/c/c$a;->b:Lb/f/c/c$d;

    iget-boolean v4, v3, Lb/f/c/c$d;->a:Z

    if-nez v4, :cond_9f

    .line 22
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v4

    iput v4, v3, Lb/f/c/c$d;->b:I

    .line 23
    iget-object v3, v5, Lb/f/c/c$a;->b:Lb/f/c/c$d;

    invoke-virtual {v2}, Landroid/view/View;->getAlpha()F

    move-result v4

    iput v4, v3, Lb/f/c/c$d;->d:F

    .line 24
    iget-object v3, v5, Lb/f/c/c$a;->b:Lb/f/c/c$d;

    iput-boolean v7, v3, Lb/f/c/c$d;->a:Z

    .line 25
    :cond_9f
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x11

    if-lt v3, v4, :cond_117

    .line 26
    iget-object v3, v5, Lb/f/c/c$a;->e:Lb/f/c/c$e;

    iget-boolean v4, v3, Lb/f/c/c$e;->a:Z

    if-nez v4, :cond_117

    .line 27
    iput-boolean v7, v3, Lb/f/c/c$e;->a:Z

    .line 28
    invoke-virtual {v2}, Landroid/view/View;->getRotation()F

    move-result v4

    iput v4, v3, Lb/f/c/c$e;->b:F

    .line 29
    iget-object v3, v5, Lb/f/c/c$a;->e:Lb/f/c/c$e;

    invoke-virtual {v2}, Landroid/view/View;->getRotationX()F

    move-result v4

    iput v4, v3, Lb/f/c/c$e;->c:F

    .line 30
    iget-object v3, v5, Lb/f/c/c$a;->e:Lb/f/c/c$e;

    invoke-virtual {v2}, Landroid/view/View;->getRotationY()F

    move-result v4

    iput v4, v3, Lb/f/c/c$e;->d:F

    .line 31
    iget-object v3, v5, Lb/f/c/c$a;->e:Lb/f/c/c$e;

    invoke-virtual {v2}, Landroid/view/View;->getScaleX()F

    move-result v4

    iput v4, v3, Lb/f/c/c$e;->e:F

    .line 32
    iget-object v3, v5, Lb/f/c/c$a;->e:Lb/f/c/c$e;

    invoke-virtual {v2}, Landroid/view/View;->getScaleY()F

    move-result v4

    iput v4, v3, Lb/f/c/c$e;->f:F

    .line 33
    invoke-virtual {v2}, Landroid/view/View;->getPivotX()F

    move-result v3

    .line 34
    invoke-virtual {v2}, Landroid/view/View;->getPivotY()F

    move-result v4

    float-to-double v6, v3

    const-wide/16 v8, 0x0

    cmpl-double v10, v6, v8

    if-nez v10, :cond_e7

    float-to-double v6, v4

    cmpl-double v10, v6, v8

    if-eqz v10, :cond_ed

    .line 35
    :cond_e7
    iget-object v6, v5, Lb/f/c/c$a;->e:Lb/f/c/c$e;

    iput v3, v6, Lb/f/c/c$e;->g:F

    .line 36
    iput v4, v6, Lb/f/c/c$e;->h:F

    .line 37
    :cond_ed
    iget-object v3, v5, Lb/f/c/c$a;->e:Lb/f/c/c$e;

    invoke-virtual {v2}, Landroid/view/View;->getTranslationX()F

    move-result v4

    iput v4, v3, Lb/f/c/c$e;->i:F

    .line 38
    iget-object v3, v5, Lb/f/c/c$a;->e:Lb/f/c/c$e;

    invoke-virtual {v2}, Landroid/view/View;->getTranslationY()F

    move-result v4

    iput v4, v3, Lb/f/c/c$e;->j:F

    .line 39
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x15

    if-lt v3, v4, :cond_117

    .line 40
    iget-object v3, v5, Lb/f/c/c$a;->e:Lb/f/c/c$e;

    invoke-virtual {v2}, Landroid/view/View;->getTranslationZ()F

    move-result v4

    iput v4, v3, Lb/f/c/c$e;->k:F

    .line 41
    iget-object v3, v5, Lb/f/c/c$a;->e:Lb/f/c/c$e;

    iget-boolean v4, v3, Lb/f/c/c$e;->l:Z

    if-eqz v4, :cond_117

    .line 42
    invoke-virtual {v2}, Landroid/view/View;->getElevation()F

    move-result v2

    iput v2, v3, Lb/f/c/c$e;->m:F

    :cond_117
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_5

    :cond_11b
    return-void
.end method

.method public e(I)I
    .registers 2

    .line 1
    invoke-virtual {p0, p1}, Lb/f/c/c;->a(I)Lb/f/c/c$a;

    move-result-object p1

    iget-object p1, p1, Lb/f/c/c$a;->b:Lb/f/c/c$d;

    iget p1, p1, Lb/f/c/c$d;->b:I

    return p1
.end method

.method public f(I)I
    .registers 2

    .line 1
    invoke-virtual {p0, p1}, Lb/f/c/c;->a(I)Lb/f/c/c$a;

    move-result-object p1

    iget-object p1, p1, Lb/f/c/c$a;->b:Lb/f/c/c$d;

    iget p1, p1, Lb/f/c/c$d;->c:I

    return p1
.end method

.method public g(I)I
    .registers 2

    .line 1
    invoke-virtual {p0, p1}, Lb/f/c/c;->a(I)Lb/f/c/c$a;

    move-result-object p1

    iget-object p1, p1, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget p1, p1, Lb/f/c/c$b;->c:I

    return p1
.end method
