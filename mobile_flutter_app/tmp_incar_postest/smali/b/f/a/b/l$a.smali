.class public Lb/f/a/b/l$a;
.super Ljava/lang/Object;
.source "KeyTrigger.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/f/a/b/l;
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

    sput-object v0, Lb/f/a/b/l$a;->a:Landroid/util/SparseIntArray;

    .line 2
    sget v1, Lb/f/c/f;->KeyTrigger_framePosition:I

    const/16 v2, 0x8

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 3
    sget-object v0, Lb/f/a/b/l$a;->a:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->KeyTrigger_onCross:I

    const/4 v2, 0x4

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 4
    sget-object v0, Lb/f/a/b/l$a;->a:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->KeyTrigger_onNegativeCross:I

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 5
    sget-object v0, Lb/f/a/b/l$a;->a:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->KeyTrigger_onPositiveCross:I

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 6
    sget-object v0, Lb/f/a/b/l$a;->a:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->KeyTrigger_motionTarget:I

    const/4 v2, 0x7

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 7
    sget-object v0, Lb/f/a/b/l$a;->a:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->KeyTrigger_triggerId:I

    const/4 v2, 0x6

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 8
    sget-object v0, Lb/f/a/b/l$a;->a:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->KeyTrigger_triggerSlack:I

    const/4 v2, 0x5

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 9
    sget-object v0, Lb/f/a/b/l$a;->a:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->KeyTrigger_motion_triggerOnCollision:I

    const/16 v2, 0x9

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 10
    sget-object v0, Lb/f/a/b/l$a;->a:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->KeyTrigger_motion_postLayoutCollision:I

    const/16 v2, 0xa

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 11
    sget-object v0, Lb/f/a/b/l$a;->a:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->KeyTrigger_triggerReceiver:I

    const/16 v2, 0xb

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    return-void
.end method

.method public static a(Lb/f/a/b/l;Landroid/content/res/TypedArray;Landroid/content/Context;)V
    .registers 7

    .line 1
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->getIndexCount()I

    move-result p2

    const/4 v0, 0x0

    :goto_5
    if-ge v0, p2, :cond_da

    .line 2
    invoke-virtual {p1, v0}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v1

    .line 3
    sget-object v2, Lb/f/a/b/l$a;->a:Landroid/util/SparseIntArray;

    invoke-virtual {v2, v1}, Landroid/util/SparseIntArray;->get(I)I

    move-result v2

    packed-switch v2, :pswitch_data_dc

    :pswitch_14
    goto/16 :goto_ae

    .line 4
    :pswitch_16
    invoke-static {p0}, Lb/f/a/b/l;->d(Lb/f/a/b/l;)I

    move-result v2

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    invoke-static {p0, v2}, Lb/f/a/b/l;->c(Lb/f/a/b/l;I)I

    goto/16 :goto_ae

    .line 5
    :pswitch_23
    invoke-static {p0}, Lb/f/a/b/l;->c(Lb/f/a/b/l;)Z

    move-result v2

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    invoke-static {p0, v1}, Lb/f/a/b/l;->a(Lb/f/a/b/l;Z)Z

    goto/16 :goto_d6

    .line 6
    :pswitch_30
    invoke-static {p0}, Lb/f/a/b/l;->b(Lb/f/a/b/l;)I

    move-result v2

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    invoke-static {p0, v1}, Lb/f/a/b/l;->b(Lb/f/a/b/l;I)I

    goto/16 :goto_d6

    .line 7
    :pswitch_3d
    iget v2, p0, Lb/f/a/b/c;->a:I

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v1

    iput v1, p0, Lb/f/a/b/c;->a:I

    int-to-float v1, v1

    const/high16 v2, 0x3f000000    # 0.5f

    add-float/2addr v1, v2

    const/high16 v2, 0x42c80000    # 100.0f

    div-float/2addr v1, v2

    .line 8
    invoke-static {p0, v1}, Lb/f/a/b/l;->a(Lb/f/a/b/l;F)F

    goto/16 :goto_d6

    .line 9
    :pswitch_51
    sget-boolean v2, Landroidx/constraintlayout/motion/widget/MotionLayout;->J0:Z

    if-eqz v2, :cond_68

    .line 10
    iget v2, p0, Lb/f/a/b/c;->b:I

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    iput v2, p0, Lb/f/a/b/c;->b:I

    const/4 v3, -0x1

    if-ne v2, v3, :cond_d6

    .line 11
    invoke-virtual {p1, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lb/f/a/b/c;->c:Ljava/lang/String;

    goto/16 :goto_d6

    .line 12
    :cond_68
    invoke-virtual {p1, v1}, Landroid/content/res/TypedArray;->peekValue(I)Landroid/util/TypedValue;

    move-result-object v2

    iget v2, v2, Landroid/util/TypedValue;->type:I

    const/4 v3, 0x3

    if-ne v2, v3, :cond_78

    .line 13
    invoke-virtual {p1, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lb/f/a/b/c;->c:Ljava/lang/String;

    goto :goto_d6

    .line 14
    :cond_78
    iget v2, p0, Lb/f/a/b/c;->b:I

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    iput v1, p0, Lb/f/a/b/c;->b:I

    goto :goto_d6

    .line 15
    :pswitch_81
    invoke-static {p0}, Lb/f/a/b/l;->a(Lb/f/a/b/l;)I

    move-result v2

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    invoke-static {p0, v1}, Lb/f/a/b/l;->a(Lb/f/a/b/l;I)I

    goto :goto_d6

    .line 16
    :pswitch_8d
    iget v2, p0, Lb/f/a/b/l;->m:F

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v1

    iput v1, p0, Lb/f/a/b/l;->m:F

    goto :goto_d6

    .line 17
    :pswitch_96
    invoke-virtual {p1, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lb/f/a/b/l;->c(Lb/f/a/b/l;Ljava/lang/String;)Ljava/lang/String;

    goto :goto_d6

    .line 18
    :pswitch_9e
    invoke-virtual {p1, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lb/f/a/b/l;->b(Lb/f/a/b/l;Ljava/lang/String;)Ljava/lang/String;

    goto :goto_d6

    .line 19
    :pswitch_a6
    invoke-virtual {p1, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lb/f/a/b/l;->a(Lb/f/a/b/l;Ljava/lang/String;)Ljava/lang/String;

    goto :goto_d6

    .line 20
    :goto_ae
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "unused attribute 0x"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "   "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v3, Lb/f/a/b/l$a;->a:Landroid/util/SparseIntArray;

    invoke-virtual {v3, v1}, Landroid/util/SparseIntArray;->get(I)I

    move-result v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "KeyTrigger"

    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_d6
    :goto_d6
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_5

    :cond_da
    return-void

    nop

    :pswitch_data_dc
    .packed-switch 0x1
        :pswitch_a6
        :pswitch_9e
        :pswitch_14
        :pswitch_96
        :pswitch_8d
        :pswitch_81
        :pswitch_51
        :pswitch_3d
        :pswitch_30
        :pswitch_23
        :pswitch_16
    .end packed-switch
.end method
