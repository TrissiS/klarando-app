.class public Lb/f/a/b/i$a;
.super Ljava/lang/Object;
.source "KeyPosition.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/f/a/b/i;
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

    sput-object v0, Lb/f/a/b/i$a;->a:Landroid/util/SparseIntArray;

    .line 2
    sget v1, Lb/f/c/f;->KeyPosition_motionTarget:I

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 3
    sget-object v0, Lb/f/a/b/i$a;->a:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->KeyPosition_framePosition:I

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 4
    sget-object v0, Lb/f/a/b/i$a;->a:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->KeyPosition_transitionEasing:I

    const/4 v2, 0x3

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 5
    sget-object v0, Lb/f/a/b/i$a;->a:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->KeyPosition_curveFit:I

    const/4 v2, 0x4

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 6
    sget-object v0, Lb/f/a/b/i$a;->a:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->KeyPosition_drawPath:I

    const/4 v2, 0x5

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 7
    sget-object v0, Lb/f/a/b/i$a;->a:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->KeyPosition_percentX:I

    const/4 v2, 0x6

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 8
    sget-object v0, Lb/f/a/b/i$a;->a:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->KeyPosition_percentY:I

    const/4 v2, 0x7

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 9
    sget-object v0, Lb/f/a/b/i$a;->a:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->KeyPosition_keyPositionType:I

    const/16 v2, 0x9

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 10
    sget-object v0, Lb/f/a/b/i$a;->a:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->KeyPosition_sizePercent:I

    const/16 v2, 0x8

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 11
    sget-object v0, Lb/f/a/b/i$a;->a:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->KeyPosition_percentWidth:I

    const/16 v2, 0xb

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 12
    sget-object v0, Lb/f/a/b/i$a;->a:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->KeyPosition_percentHeight:I

    const/16 v2, 0xc

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 13
    sget-object v0, Lb/f/a/b/i$a;->a:Landroid/util/SparseIntArray;

    sget v1, Lb/f/c/f;->KeyPosition_pathMotionArc:I

    const/16 v2, 0xa

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    return-void
.end method

.method public static synthetic a(Lb/f/a/b/i;Landroid/content/res/TypedArray;)V
    .registers 2

    .line 1
    invoke-static {p0, p1}, Lb/f/a/b/i$a;->b(Lb/f/a/b/i;Landroid/content/res/TypedArray;)V

    return-void
.end method

.method public static b(Lb/f/a/b/i;Landroid/content/res/TypedArray;)V
    .registers 10

    .line 1
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->getIndexCount()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_6
    const-string v3, "KeyPosition"

    const/4 v4, -0x1

    if-ge v2, v0, :cond_ed

    .line 2
    invoke-virtual {p1, v2}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v5

    .line 3
    sget-object v6, Lb/f/a/b/i$a;->a:Landroid/util/SparseIntArray;

    invoke-virtual {v6, v5}, Landroid/util/SparseIntArray;->get(I)I

    move-result v6

    const/4 v7, 0x3

    packed-switch v6, :pswitch_data_f8

    .line 4
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "unused attribute 0x"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v5}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "   "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v6, Lb/f/a/b/i$a;->a:Landroid/util/SparseIntArray;

    invoke-virtual {v6, v5}, Landroid/util/SparseIntArray;->get(I)I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_e9

    .line 5
    :pswitch_41
    iget v3, p0, Lb/f/a/b/i;->k:F

    invoke-virtual {p1, v5, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v3

    iput v3, p0, Lb/f/a/b/i;->k:F

    goto/16 :goto_e9

    .line 6
    :pswitch_4b
    iget v3, p0, Lb/f/a/b/i;->j:F

    invoke-virtual {p1, v5, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v3

    iput v3, p0, Lb/f/a/b/i;->j:F

    goto/16 :goto_e9

    .line 7
    :pswitch_55
    iget v3, p0, Lb/f/a/b/i;->h:I

    invoke-virtual {p1, v5, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v3

    iput v3, p0, Lb/f/a/b/i;->h:I

    goto/16 :goto_e9

    .line 8
    :pswitch_5f
    iget v3, p0, Lb/f/a/b/i;->p:I

    invoke-virtual {p1, v5, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v3

    iput v3, p0, Lb/f/a/b/i;->p:I

    goto/16 :goto_e9

    .line 9
    :pswitch_69
    iget v3, p0, Lb/f/a/b/i;->k:F

    invoke-virtual {p1, v5, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v3

    iput v3, p0, Lb/f/a/b/i;->j:F

    iput v3, p0, Lb/f/a/b/i;->k:F

    goto/16 :goto_e9

    .line 10
    :pswitch_75
    iget v3, p0, Lb/f/a/b/i;->m:F

    invoke-virtual {p1, v5, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v3

    iput v3, p0, Lb/f/a/b/i;->m:F

    goto/16 :goto_e9

    .line 11
    :pswitch_7f
    iget v3, p0, Lb/f/a/b/i;->l:F

    invoke-virtual {p1, v5, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v3

    iput v3, p0, Lb/f/a/b/i;->l:F

    goto :goto_e9

    .line 12
    :pswitch_88
    iget v3, p0, Lb/f/a/b/i;->i:I

    invoke-virtual {p1, v5, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v3

    iput v3, p0, Lb/f/a/b/i;->i:I

    goto :goto_e9

    .line 13
    :pswitch_91
    iget v3, p0, Lb/f/a/b/j;->f:I

    invoke-virtual {p1, v5, v3}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v3

    iput v3, p0, Lb/f/a/b/j;->f:I

    goto :goto_e9

    .line 14
    :pswitch_9a
    invoke-virtual {p1, v5}, Landroid/content/res/TypedArray;->peekValue(I)Landroid/util/TypedValue;

    move-result-object v3

    iget v3, v3, Landroid/util/TypedValue;->type:I

    if-ne v3, v7, :cond_a9

    .line 15
    invoke-virtual {p1, v5}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lb/f/a/b/i;->g:Ljava/lang/String;

    goto :goto_e9

    .line 16
    :cond_a9
    sget-object v3, Lb/f/a/a/c;->c:[Ljava/lang/String;

    invoke-virtual {p1, v5, v1}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v4

    aget-object v3, v3, v4

    iput-object v3, p0, Lb/f/a/b/i;->g:Ljava/lang/String;

    goto :goto_e9

    .line 17
    :pswitch_b4
    iget v3, p0, Lb/f/a/b/c;->a:I

    invoke-virtual {p1, v5, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v3

    iput v3, p0, Lb/f/a/b/c;->a:I

    goto :goto_e9

    .line 18
    :pswitch_bd
    sget-boolean v3, Landroidx/constraintlayout/motion/widget/MotionLayout;->J0:Z

    if-eqz v3, :cond_d2

    .line 19
    iget v3, p0, Lb/f/a/b/c;->b:I

    invoke-virtual {p1, v5, v3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v3

    iput v3, p0, Lb/f/a/b/c;->b:I

    if-ne v3, v4, :cond_e9

    .line 20
    invoke-virtual {p1, v5}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lb/f/a/b/c;->c:Ljava/lang/String;

    goto :goto_e9

    .line 21
    :cond_d2
    invoke-virtual {p1, v5}, Landroid/content/res/TypedArray;->peekValue(I)Landroid/util/TypedValue;

    move-result-object v3

    iget v3, v3, Landroid/util/TypedValue;->type:I

    if-ne v3, v7, :cond_e1

    .line 22
    invoke-virtual {p1, v5}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lb/f/a/b/c;->c:Ljava/lang/String;

    goto :goto_e9

    .line 23
    :cond_e1
    iget v3, p0, Lb/f/a/b/c;->b:I

    invoke-virtual {p1, v5, v3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v3

    iput v3, p0, Lb/f/a/b/c;->b:I

    :cond_e9
    :goto_e9
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_6

    .line 24
    :cond_ed
    iget p0, p0, Lb/f/a/b/c;->a:I

    if-ne p0, v4, :cond_f6

    const-string p0, "no frame position"

    .line 25
    invoke-static {v3, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_f6
    return-void

    nop

    :pswitch_data_f8
    .packed-switch 0x1
        :pswitch_bd
        :pswitch_b4
        :pswitch_9a
        :pswitch_91
        :pswitch_88
        :pswitch_7f
        :pswitch_75
        :pswitch_69
        :pswitch_5f
        :pswitch_55
        :pswitch_4b
        :pswitch_41
    .end packed-switch
.end method
