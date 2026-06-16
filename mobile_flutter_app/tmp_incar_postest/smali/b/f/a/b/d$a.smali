.class public Lb/f/a/b/d$a;
.super Ljava/lang/Object;
.source "KeyAttributes.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/f/a/b/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# static fields
.field public static a:Landroid/util/SparseIntArray;


# direct methods
.method public static constructor <clinit>()V
    .registers 3

    .line 1
    new-instance v0, Landroid/util/SparseIntArray;

    invoke-direct {v0}, Landroid/util/SparseIntArray;-><init>()V

    sput-object v0, Lb/f/a/b/d$a;->a:Landroid/util/SparseIntArray;

    .line 2
    sget v1, Lb/f/c/f;->KeyAttribute_android_alpha:I

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 3
    sget-object v0, Lb/f/a/b/d$a;->a:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->KeyAttribute_android_elevation:I

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 4
    sget-object v0, Lb/f/a/b/d$a;->a:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->KeyAttribute_android_rotation:I

    const/4 v2, 0x4

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 5
    sget-object v0, Lb/f/a/b/d$a;->a:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->KeyAttribute_android_rotationX:I

    const/4 v2, 0x5

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 6
    sget-object v0, Lb/f/a/b/d$a;->a:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->KeyAttribute_android_rotationY:I

    const/4 v2, 0x6

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 7
    sget-object v0, Lb/f/a/b/d$a;->a:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->KeyAttribute_android_transformPivotX:I

    const/16 v2, 0x13

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 8
    sget-object v0, Lb/f/a/b/d$a;->a:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->KeyAttribute_android_transformPivotY:I

    const/16 v2, 0x14

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 9
    sget-object v0, Lb/f/a/b/d$a;->a:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->KeyAttribute_android_scaleX:I

    const/4 v2, 0x7

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 10
    sget-object v0, Lb/f/a/b/d$a;->a:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->KeyAttribute_transitionPathRotate:I

    const/16 v2, 0x8

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 11
    sget-object v0, Lb/f/a/b/d$a;->a:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->KeyAttribute_transitionEasing:I

    const/16 v2, 0x9

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 12
    sget-object v0, Lb/f/a/b/d$a;->a:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->KeyAttribute_motionTarget:I

    const/16 v2, 0xa

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 13
    sget-object v0, Lb/f/a/b/d$a;->a:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->KeyAttribute_framePosition:I

    const/16 v2, 0xc

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 14
    sget-object v0, Lb/f/a/b/d$a;->a:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->KeyAttribute_curveFit:I

    const/16 v2, 0xd

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 15
    sget-object v0, Lb/f/a/b/d$a;->a:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->KeyAttribute_android_scaleY:I

    const/16 v2, 0xe

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 16
    sget-object v0, Lb/f/a/b/d$a;->a:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->KeyAttribute_android_translationX:I

    const/16 v2, 0xf

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 17
    sget-object v0, Lb/f/a/b/d$a;->a:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->KeyAttribute_android_translationY:I

    const/16 v2, 0x10

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 18
    sget-object v0, Lb/f/a/b/d$a;->a:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->KeyAttribute_android_translationZ:I

    const/16 v2, 0x11

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 19
    sget-object v0, Lb/f/a/b/d$a;->a:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->KeyAttribute_motionProgress:I

    const/16 v2, 0x12

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    return-void
.end method

.method public static a(Lb/f/a/b/d;Landroid/content/res/TypedArray;)V
    .registers 7

    .line 1
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->getIndexCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_5
    if-ge v1, v0, :cond_145

    .line 2
    invoke-virtual {p1, v1}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v2

    .line 3
    sget-object v3, Lb/f/a/b/d$a;->a:Landroid/util/SparseIntArray;

    invoke-virtual {v3, v2}, Landroid/util/SparseIntArray;->get(I)I

    move-result v3

    packed-switch v3, :pswitch_data_146

    .line 4
    :pswitch_14
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "unused attribute 0x"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "   "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v4, Lb/f/a/b/d$a;->a:Landroid/util/SparseIntArray;

    invoke-virtual {v4, v2}, Landroid/util/SparseIntArray;->get(I)I

    move-result v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "KeyAttribute"

    invoke-static {v3, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_141

    .line 5
    :pswitch_3e
    invoke-static {p0}, Lb/f/a/b/d;->o(Lb/f/a/b/d;)F

    move-result v3

    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v2

    invoke-static {p0, v2}, Lb/f/a/b/d;->n(Lb/f/a/b/d;F)F

    goto/16 :goto_141

    .line 6
    :pswitch_4b
    invoke-static {p0}, Lb/f/a/b/d;->n(Lb/f/a/b/d;)F

    move-result v3

    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v2

    invoke-static {p0, v2}, Lb/f/a/b/d;->m(Lb/f/a/b/d;F)F

    goto/16 :goto_141

    .line 7
    :pswitch_58
    invoke-static {p0}, Lb/f/a/b/d;->h(Lb/f/a/b/d;)F

    move-result v3

    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    invoke-static {p0, v2}, Lb/f/a/b/d;->h(Lb/f/a/b/d;F)F

    goto/16 :goto_141

    .line 8
    :pswitch_65
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x15

    if-lt v3, v4, :cond_141

    .line 9
    invoke-static {p0}, Lb/f/a/b/d;->g(Lb/f/a/b/d;)F

    move-result v3

    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v2

    invoke-static {p0, v2}, Lb/f/a/b/d;->g(Lb/f/a/b/d;F)F

    goto/16 :goto_141

    .line 10
    :pswitch_78
    invoke-static {p0}, Lb/f/a/b/d;->f(Lb/f/a/b/d;)F

    move-result v3

    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v2

    invoke-static {p0, v2}, Lb/f/a/b/d;->f(Lb/f/a/b/d;F)F

    goto/16 :goto_141

    .line 11
    :pswitch_85
    invoke-static {p0}, Lb/f/a/b/d;->e(Lb/f/a/b/d;)F

    move-result v3

    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v2

    invoke-static {p0, v2}, Lb/f/a/b/d;->e(Lb/f/a/b/d;F)F

    goto/16 :goto_141

    .line 12
    :pswitch_92
    invoke-static {p0}, Lb/f/a/b/d;->c(Lb/f/a/b/d;)F

    move-result v3

    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    invoke-static {p0, v2}, Lb/f/a/b/d;->b(Lb/f/a/b/d;F)F

    goto/16 :goto_141

    .line 13
    :pswitch_9f
    invoke-static {p0}, Lb/f/a/b/d;->j(Lb/f/a/b/d;)I

    move-result v3

    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v2

    invoke-static {p0, v2}, Lb/f/a/b/d;->a(Lb/f/a/b/d;I)I

    goto/16 :goto_141

    .line 14
    :pswitch_ac
    iget v3, p0, Lb/f/a/b/c;->a:I

    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, p0, Lb/f/a/b/c;->a:I

    goto/16 :goto_141

    .line 15
    :pswitch_b6
    sget-boolean v3, Landroidx/constraintlayout/motion/widget/MotionLayout;->J0:Z

    if-eqz v3, :cond_cd

    .line 16
    iget v3, p0, Lb/f/a/b/c;->b:I

    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v3

    iput v3, p0, Lb/f/a/b/c;->b:I

    const/4 v4, -0x1

    if-ne v3, v4, :cond_141

    .line 17
    invoke-virtual {p1, v2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lb/f/a/b/c;->c:Ljava/lang/String;

    goto/16 :goto_141

    .line 18
    :cond_cd
    invoke-virtual {p1, v2}, Landroid/content/res/TypedArray;->peekValue(I)Landroid/util/TypedValue;

    move-result-object v3

    iget v3, v3, Landroid/util/TypedValue;->type:I

    const/4 v4, 0x3

    if-ne v3, v4, :cond_dd

    .line 19
    invoke-virtual {p1, v2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lb/f/a/b/c;->c:Ljava/lang/String;

    goto :goto_141

    .line 20
    :cond_dd
    iget v3, p0, Lb/f/a/b/c;->b:I

    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    iput v2, p0, Lb/f/a/b/c;->b:I

    goto :goto_141

    .line 21
    :pswitch_e6
    invoke-virtual {p1, v2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v2}, Lb/f/a/b/d;->a(Lb/f/a/b/d;Ljava/lang/String;)Ljava/lang/String;

    goto :goto_141

    .line 22
    :pswitch_ee
    invoke-static {p0}, Lb/f/a/b/d;->d(Lb/f/a/b/d;)F

    move-result v3

    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    invoke-static {p0, v2}, Lb/f/a/b/d;->d(Lb/f/a/b/d;F)F

    goto :goto_141

    .line 23
    :pswitch_fa
    invoke-static {p0}, Lb/f/a/b/d;->k(Lb/f/a/b/d;)F

    move-result v3

    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    invoke-static {p0, v2}, Lb/f/a/b/d;->j(Lb/f/a/b/d;F)F

    goto :goto_141

    .line 24
    :pswitch_106
    invoke-static {p0}, Lb/f/a/b/d;->m(Lb/f/a/b/d;)F

    move-result v3

    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    invoke-static {p0, v2}, Lb/f/a/b/d;->l(Lb/f/a/b/d;F)F

    goto :goto_141

    .line 25
    :pswitch_112
    invoke-static {p0}, Lb/f/a/b/d;->l(Lb/f/a/b/d;)F

    move-result v3

    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    invoke-static {p0, v2}, Lb/f/a/b/d;->k(Lb/f/a/b/d;F)F

    goto :goto_141

    .line 26
    :pswitch_11e
    invoke-static {p0}, Lb/f/a/b/d;->i(Lb/f/a/b/d;)F

    move-result v3

    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    invoke-static {p0, v2}, Lb/f/a/b/d;->i(Lb/f/a/b/d;F)F

    goto :goto_141

    .line 27
    :pswitch_12a
    invoke-static {p0}, Lb/f/a/b/d;->b(Lb/f/a/b/d;)F

    move-result v3

    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v2

    invoke-static {p0, v2}, Lb/f/a/b/d;->c(Lb/f/a/b/d;F)F

    goto :goto_141

    .line 28
    :pswitch_136
    invoke-static {p0}, Lb/f/a/b/d;->a(Lb/f/a/b/d;)F

    move-result v3

    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    invoke-static {p0, v2}, Lb/f/a/b/d;->a(Lb/f/a/b/d;F)F

    :cond_141
    :goto_141
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_5

    :cond_145
    return-void

    :pswitch_data_146
    .packed-switch 0x1
        :pswitch_136
        :pswitch_12a
        :pswitch_14
        :pswitch_11e
        :pswitch_112
        :pswitch_106
        :pswitch_fa
        :pswitch_ee
        :pswitch_e6
        :pswitch_b6
        :pswitch_14
        :pswitch_ac
        :pswitch_9f
        :pswitch_92
        :pswitch_85
        :pswitch_78
        :pswitch_65
        :pswitch_58
        :pswitch_4b
        :pswitch_3e
    .end packed-switch
.end method
