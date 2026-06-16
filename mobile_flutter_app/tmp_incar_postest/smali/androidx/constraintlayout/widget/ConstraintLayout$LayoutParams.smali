.class public Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;
.super Landroid/view/ViewGroup$MarginLayoutParams;
.source "ConstraintLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/constraintlayout/widget/ConstraintLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "LayoutParams"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams$a;
    }
.end annotation


# instance fields
.field public A:F

.field public B:Ljava/lang/String;

.field public C:I

.field public D:F

.field public E:F

.field public F:I

.field public G:I

.field public H:I

.field public I:I

.field public J:I

.field public K:I

.field public L:I

.field public M:I

.field public N:F

.field public O:F

.field public P:I

.field public Q:I

.field public R:I

.field public S:Z

.field public T:Z

.field public U:Ljava/lang/String;

.field public V:Z

.field public W:Z

.field public X:Z

.field public Y:Z

.field public Z:Z

.field public a:I

.field public a0:Z

.field public b:I

.field public b0:Z

.field public c:F

.field public c0:I

.field public d:I

.field public d0:I

.field public e:I

.field public e0:I

.field public f:I

.field public f0:I

.field public g:I

.field public g0:I

.field public h:I

.field public h0:I

.field public i:I

.field public i0:F

.field public j:I

.field public j0:I

.field public k:I

.field public k0:I

.field public l:I

.field public l0:F

.field public m:I

.field public m0:Lb/f/b/k/e;

.field public n:I

.field public n0:Z

.field public o:F

.field public p:I

.field public q:I

.field public r:I

.field public s:I

.field public t:I

.field public u:I

.field public v:I

.field public w:I

.field public x:I

.field public y:I

.field public z:F


# direct methods
.method public constructor <init>(II)V
    .registers 7

    .line 163
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    const/4 p1, -0x1

    .line 164
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->a:I

    .line 165
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->b:I

    const/high16 p2, -0x40800000    # -1.0f

    .line 166
    iput p2, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->c:F

    .line 167
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->d:I

    .line 168
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->e:I

    .line 169
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->f:I

    .line 170
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->g:I

    .line 171
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->h:I

    .line 172
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->i:I

    .line 173
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->j:I

    .line 174
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->k:I

    .line 175
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->l:I

    .line 176
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->m:I

    const/4 v0, 0x0

    .line 177
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->n:I

    const/4 v1, 0x0

    .line 178
    iput v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->o:F

    .line 179
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->p:I

    .line 180
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->q:I

    .line 181
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->r:I

    .line 182
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->s:I

    .line 183
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->t:I

    .line 184
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->u:I

    .line 185
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->v:I

    .line 186
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->w:I

    .line 187
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->x:I

    .line 188
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->y:I

    const/high16 v1, 0x3f000000    # 0.5f

    .line 189
    iput v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->z:F

    .line 190
    iput v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->A:F

    const/4 v2, 0x0

    .line 191
    iput-object v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->B:Ljava/lang/String;

    const/4 v3, 0x1

    .line 192
    iput v3, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->C:I

    .line 193
    iput p2, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->D:F

    .line 194
    iput p2, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->E:F

    .line 195
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->F:I

    .line 196
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->G:I

    .line 197
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->H:I

    .line 198
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->I:I

    .line 199
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->J:I

    .line 200
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->K:I

    .line 201
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->L:I

    .line 202
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->M:I

    const/high16 p2, 0x3f800000    # 1.0f

    .line 203
    iput p2, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->N:F

    .line 204
    iput p2, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->O:F

    .line 205
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->P:I

    .line 206
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->Q:I

    .line 207
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->R:I

    .line 208
    iput-boolean v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->S:Z

    .line 209
    iput-boolean v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->T:Z

    .line 210
    iput-object v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->U:Ljava/lang/String;

    .line 211
    iput-boolean v3, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->V:Z

    .line 212
    iput-boolean v3, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->W:Z

    .line 213
    iput-boolean v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->X:Z

    .line 214
    iput-boolean v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->Y:Z

    .line 215
    iput-boolean v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->Z:Z

    .line 216
    iput-boolean v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->a0:Z

    .line 217
    iput-boolean v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->b0:Z

    .line 218
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->c0:I

    .line 219
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->d0:I

    .line 220
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->e0:I

    .line 221
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->f0:I

    .line 222
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->g0:I

    .line 223
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->h0:I

    .line 224
    iput v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->i0:F

    .line 225
    new-instance p1, Lb/f/b/k/e;

    invoke-direct {p1}, Lb/f/b/k/e;-><init>()V

    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->m0:Lb/f/b/k/e;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 13

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 v0, -0x1

    .line 2
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->a:I

    .line 3
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->b:I

    const/high16 v1, -0x40800000    # -1.0f

    .line 4
    iput v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->c:F

    .line 5
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->d:I

    .line 6
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->e:I

    .line 7
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->f:I

    .line 8
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->g:I

    .line 9
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->h:I

    .line 10
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->i:I

    .line 11
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->j:I

    .line 12
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->k:I

    .line 13
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->l:I

    .line 14
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->m:I

    const/4 v2, 0x0

    .line 15
    iput v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->n:I

    const/4 v3, 0x0

    .line 16
    iput v3, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->o:F

    .line 17
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->p:I

    .line 18
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->q:I

    .line 19
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->r:I

    .line 20
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->s:I

    .line 21
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->t:I

    .line 22
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->u:I

    .line 23
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->v:I

    .line 24
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->w:I

    .line 25
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->x:I

    .line 26
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->y:I

    const/high16 v4, 0x3f000000    # 0.5f

    .line 27
    iput v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->z:F

    .line 28
    iput v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->A:F

    const/4 v5, 0x0

    .line 29
    iput-object v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->B:Ljava/lang/String;

    const/4 v6, 0x1

    .line 30
    iput v6, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->C:I

    .line 31
    iput v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->D:F

    .line 32
    iput v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->E:F

    .line 33
    iput v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->F:I

    .line 34
    iput v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->G:I

    .line 35
    iput v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->H:I

    .line 36
    iput v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->I:I

    .line 37
    iput v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->J:I

    .line 38
    iput v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->K:I

    .line 39
    iput v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->L:I

    .line 40
    iput v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->M:I

    const/high16 v1, 0x3f800000    # 1.0f

    .line 41
    iput v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->N:F

    .line 42
    iput v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->O:F

    .line 43
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->P:I

    .line 44
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->Q:I

    .line 45
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->R:I

    .line 46
    iput-boolean v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->S:Z

    .line 47
    iput-boolean v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->T:Z

    .line 48
    iput-object v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->U:Ljava/lang/String;

    .line 49
    iput-boolean v6, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->V:Z

    .line 50
    iput-boolean v6, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->W:Z

    .line 51
    iput-boolean v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->X:Z

    .line 52
    iput-boolean v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->Y:Z

    .line 53
    iput-boolean v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->Z:Z

    .line 54
    iput-boolean v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->a0:Z

    .line 55
    iput-boolean v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->b0:Z

    .line 56
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->c0:I

    .line 57
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->d0:I

    .line 58
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->e0:I

    .line 59
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->f0:I

    .line 60
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->g0:I

    .line 61
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->h0:I

    .line 62
    iput v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->i0:F

    .line 63
    new-instance v1, Lb/f/b/k/e;

    invoke-direct {v1}, Lb/f/b/k/e;-><init>()V

    iput-object v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->m0:Lb/f/b/k/e;

    .line 64
    sget-object v1, Lb/f/c/f;->ConstraintLayout_Layout:[I

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 65
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->getIndexCount()I

    move-result p2

    const/4 v1, 0x0

    :goto_9a
    if-ge v1, p2, :cond_3c2

    .line 66
    invoke-virtual {p1, v1}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v4

    .line 67
    sget-object v5, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams$a;->a:Landroid/util/SparseIntArray;

    invoke-virtual {v5, v4}, Landroid/util/SparseIntArray;->get(I)I

    move-result v5

    const-string v7, "ConstraintLayout"

    const/4 v8, 0x2

    const/4 v9, -0x2

    packed-switch v5, :pswitch_data_3ca

    packed-switch v5, :pswitch_data_41a

    goto/16 :goto_3be

    .line 68
    :pswitch_b2
    invoke-virtual {p1, v4}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->U:Ljava/lang/String;

    goto/16 :goto_3be

    .line 69
    :pswitch_ba
    iget v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->Q:I

    invoke-virtual {p1, v4, v5}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v4

    iput v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->Q:I

    goto/16 :goto_3be

    .line 70
    :pswitch_c4
    iget v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->P:I

    invoke-virtual {p1, v4, v5}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v4

    iput v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->P:I

    goto/16 :goto_3be

    .line 71
    :pswitch_ce
    invoke-virtual {p1, v4, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v4

    iput v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->G:I

    goto/16 :goto_3be

    .line 72
    :pswitch_d6
    invoke-virtual {p1, v4, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v4

    iput v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->F:I

    goto/16 :goto_3be

    .line 73
    :pswitch_de
    iget v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->E:F

    invoke-virtual {p1, v4, v5}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v4

    iput v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->E:F

    goto/16 :goto_3be

    .line 74
    :pswitch_e8
    iget v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->D:F

    invoke-virtual {p1, v4, v5}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v4

    iput v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->D:F

    goto/16 :goto_3be

    .line 75
    :pswitch_f2
    invoke-virtual {p1, v4}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->B:Ljava/lang/String;

    .line 76
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->C:I

    if-eqz v4, :cond_3be

    .line 77
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    .line 78
    iget-object v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->B:Ljava/lang/String;

    const/16 v7, 0x2c

    invoke-virtual {v5, v7}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    if-lez v5, :cond_12c

    add-int/lit8 v7, v4, -0x1

    if-ge v5, v7, :cond_12c

    .line 79
    iget-object v7, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->B:Ljava/lang/String;

    invoke-virtual {v7, v2, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    const-string v8, "W"

    .line 80
    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_11f

    .line 81
    iput v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->C:I

    goto :goto_129

    :cond_11f
    const-string v8, "H"

    .line 82
    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_129

    .line 83
    iput v6, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->C:I

    :cond_129
    :goto_129
    add-int/lit8 v5, v5, 0x1

    goto :goto_12d

    :cond_12c
    const/4 v5, 0x0

    .line 84
    :goto_12d
    iget-object v7, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->B:Ljava/lang/String;

    const/16 v8, 0x3a

    invoke-virtual {v7, v8}, Ljava/lang/String;->indexOf(I)I

    move-result v7

    if-ltz v7, :cond_175

    add-int/lit8 v4, v4, -0x1

    if-ge v7, v4, :cond_175

    .line 85
    iget-object v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->B:Ljava/lang/String;

    invoke-virtual {v4, v5, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 86
    iget-object v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->B:Ljava/lang/String;

    add-int/lit8 v7, v7, 0x1

    invoke-virtual {v5, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    .line 87
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_3be

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_3be

    .line 88
    :try_start_155
    invoke-static {v4}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v4

    .line 89
    invoke-static {v5}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v5

    cmpl-float v7, v4, v3

    if-lez v7, :cond_3be

    cmpl-float v7, v5, v3

    if-lez v7, :cond_3be

    .line 90
    iget v7, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->C:I

    if-ne v7, v6, :cond_16f

    div-float/2addr v5, v4

    .line 91
    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    goto/16 :goto_3be

    :cond_16f
    div-float/2addr v4, v5

    .line 92
    invoke-static {v4}, Ljava/lang/Math;->abs(F)F
    :try_end_173
    .catch Ljava/lang/NumberFormatException; {:try_start_155 .. :try_end_173} :catch_3be

    goto/16 :goto_3be

    .line 93
    :cond_175
    iget-object v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->B:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    .line 94
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_3be

    .line 95
    :try_start_181
    invoke-static {v4}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F
    :try_end_184
    .catch Ljava/lang/NumberFormatException; {:try_start_181 .. :try_end_184} :catch_3be

    goto/16 :goto_3be

    .line 96
    :pswitch_186
    iget v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->O:F

    invoke-virtual {p1, v4, v5}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->max(FF)F

    move-result v4

    iput v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->O:F

    .line 97
    iput v8, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->I:I

    goto/16 :goto_3be

    .line 98
    :pswitch_196
    :try_start_196
    iget v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->M:I

    invoke-virtual {p1, v4, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v5

    iput v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->M:I
    :try_end_19e
    .catch Ljava/lang/Exception; {:try_start_196 .. :try_end_19e} :catch_1a0

    goto/16 :goto_3be

    :catch_1a0
    nop

    .line 99
    iget v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->M:I

    invoke-virtual {p1, v4, v5}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v4

    if-ne v4, v9, :cond_3be

    .line 100
    iput v9, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->M:I

    goto/16 :goto_3be

    .line 101
    :pswitch_1ad
    :try_start_1ad
    iget v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->K:I

    invoke-virtual {p1, v4, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v5

    iput v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->K:I
    :try_end_1b5
    .catch Ljava/lang/Exception; {:try_start_1ad .. :try_end_1b5} :catch_1b7

    goto/16 :goto_3be

    :catch_1b7
    nop

    .line 102
    iget v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->K:I

    invoke-virtual {p1, v4, v5}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v4

    if-ne v4, v9, :cond_3be

    .line 103
    iput v9, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->K:I

    goto/16 :goto_3be

    .line 104
    :pswitch_1c4
    iget v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->N:F

    invoke-virtual {p1, v4, v5}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->max(FF)F

    move-result v4

    iput v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->N:F

    .line 105
    iput v8, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->H:I

    goto/16 :goto_3be

    .line 106
    :pswitch_1d4
    :try_start_1d4
    iget v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->L:I

    invoke-virtual {p1, v4, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v5

    iput v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->L:I
    :try_end_1dc
    .catch Ljava/lang/Exception; {:try_start_1d4 .. :try_end_1dc} :catch_1de

    goto/16 :goto_3be

    :catch_1de
    nop

    .line 107
    iget v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->L:I

    invoke-virtual {p1, v4, v5}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v4

    if-ne v4, v9, :cond_3be

    .line 108
    iput v9, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->L:I

    goto/16 :goto_3be

    .line 109
    :pswitch_1eb
    :try_start_1eb
    iget v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->J:I

    invoke-virtual {p1, v4, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v5

    iput v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->J:I
    :try_end_1f3
    .catch Ljava/lang/Exception; {:try_start_1eb .. :try_end_1f3} :catch_1f5

    goto/16 :goto_3be

    :catch_1f5
    nop

    .line 110
    iget v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->J:I

    invoke-virtual {p1, v4, v5}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v4

    if-ne v4, v9, :cond_3be

    .line 111
    iput v9, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->J:I

    goto/16 :goto_3be

    .line 112
    :pswitch_202
    invoke-virtual {p1, v4, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v4

    iput v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->I:I

    if-ne v4, v6, :cond_3be

    const-string v4, "layout_constraintHeight_default=\"wrap\" is deprecated.\nUse layout_height=\"WRAP_CONTENT\" and layout_constrainedHeight=\"true\" instead."

    .line 113
    invoke-static {v7, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_3be

    .line 114
    :pswitch_211
    invoke-virtual {p1, v4, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v4

    iput v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->H:I

    if-ne v4, v6, :cond_3be

    const-string v4, "layout_constraintWidth_default=\"wrap\" is deprecated.\nUse layout_width=\"WRAP_CONTENT\" and layout_constrainedWidth=\"true\" instead."

    .line 115
    invoke-static {v7, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_3be

    .line 116
    :pswitch_220
    iget v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->A:F

    invoke-virtual {p1, v4, v5}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v4

    iput v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->A:F

    goto/16 :goto_3be

    .line 117
    :pswitch_22a
    iget v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->z:F

    invoke-virtual {p1, v4, v5}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v4

    iput v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->z:F

    goto/16 :goto_3be

    .line 118
    :pswitch_234
    iget-boolean v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->T:Z

    invoke-virtual {p1, v4, v5}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v4

    iput-boolean v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->T:Z

    goto/16 :goto_3be

    .line 119
    :pswitch_23e
    iget-boolean v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->S:Z

    invoke-virtual {p1, v4, v5}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v4

    iput-boolean v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->S:Z

    goto/16 :goto_3be

    .line 120
    :pswitch_248
    iget v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->y:I

    invoke-virtual {p1, v4, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    iput v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->y:I

    goto/16 :goto_3be

    .line 121
    :pswitch_252
    iget v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->x:I

    invoke-virtual {p1, v4, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    iput v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->x:I

    goto/16 :goto_3be

    .line 122
    :pswitch_25c
    iget v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->w:I

    invoke-virtual {p1, v4, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    iput v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->w:I

    goto/16 :goto_3be

    .line 123
    :pswitch_266
    iget v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->v:I

    invoke-virtual {p1, v4, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    iput v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->v:I

    goto/16 :goto_3be

    .line 124
    :pswitch_270
    iget v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->u:I

    invoke-virtual {p1, v4, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    iput v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->u:I

    goto/16 :goto_3be

    .line 125
    :pswitch_27a
    iget v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->t:I

    invoke-virtual {p1, v4, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    iput v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->t:I

    goto/16 :goto_3be

    .line 126
    :pswitch_284
    iget v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->s:I

    invoke-virtual {p1, v4, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v5

    iput v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->s:I

    if-ne v5, v0, :cond_3be

    .line 127
    invoke-virtual {p1, v4, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v4

    iput v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->s:I

    goto/16 :goto_3be

    .line 128
    :pswitch_296
    iget v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->r:I

    invoke-virtual {p1, v4, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v5

    iput v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->r:I

    if-ne v5, v0, :cond_3be

    .line 129
    invoke-virtual {p1, v4, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v4

    iput v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->r:I

    goto/16 :goto_3be

    .line 130
    :pswitch_2a8
    iget v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->q:I

    invoke-virtual {p1, v4, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v5

    iput v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->q:I

    if-ne v5, v0, :cond_3be

    .line 131
    invoke-virtual {p1, v4, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v4

    iput v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->q:I

    goto/16 :goto_3be

    .line 132
    :pswitch_2ba
    iget v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->p:I

    invoke-virtual {p1, v4, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v5

    iput v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->p:I

    if-ne v5, v0, :cond_3be

    .line 133
    invoke-virtual {p1, v4, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v4

    iput v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->p:I

    goto/16 :goto_3be

    .line 134
    :pswitch_2cc
    iget v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->l:I

    invoke-virtual {p1, v4, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v5

    iput v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->l:I

    if-ne v5, v0, :cond_3be

    .line 135
    invoke-virtual {p1, v4, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v4

    iput v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->l:I

    goto/16 :goto_3be

    .line 136
    :pswitch_2de
    iget v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->k:I

    invoke-virtual {p1, v4, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v5

    iput v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->k:I

    if-ne v5, v0, :cond_3be

    .line 137
    invoke-virtual {p1, v4, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v4

    iput v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->k:I

    goto/16 :goto_3be

    .line 138
    :pswitch_2f0
    iget v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->j:I

    invoke-virtual {p1, v4, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v5

    iput v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->j:I

    if-ne v5, v0, :cond_3be

    .line 139
    invoke-virtual {p1, v4, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v4

    iput v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->j:I

    goto/16 :goto_3be

    .line 140
    :pswitch_302
    iget v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->i:I

    invoke-virtual {p1, v4, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v5

    iput v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->i:I

    if-ne v5, v0, :cond_3be

    .line 141
    invoke-virtual {p1, v4, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v4

    iput v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->i:I

    goto/16 :goto_3be

    .line 142
    :pswitch_314
    iget v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->h:I

    invoke-virtual {p1, v4, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v5

    iput v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->h:I

    if-ne v5, v0, :cond_3be

    .line 143
    invoke-virtual {p1, v4, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v4

    iput v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->h:I

    goto/16 :goto_3be

    .line 144
    :pswitch_326
    iget v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->g:I

    invoke-virtual {p1, v4, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v5

    iput v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->g:I

    if-ne v5, v0, :cond_3be

    .line 145
    invoke-virtual {p1, v4, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v4

    iput v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->g:I

    goto/16 :goto_3be

    .line 146
    :pswitch_338
    iget v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->f:I

    invoke-virtual {p1, v4, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v5

    iput v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->f:I

    if-ne v5, v0, :cond_3be

    .line 147
    invoke-virtual {p1, v4, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v4

    iput v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->f:I

    goto/16 :goto_3be

    .line 148
    :pswitch_34a
    iget v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->e:I

    invoke-virtual {p1, v4, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v5

    iput v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->e:I

    if-ne v5, v0, :cond_3be

    .line 149
    invoke-virtual {p1, v4, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v4

    iput v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->e:I

    goto :goto_3be

    .line 150
    :pswitch_35b
    iget v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->d:I

    invoke-virtual {p1, v4, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v5

    iput v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->d:I

    if-ne v5, v0, :cond_3be

    .line 151
    invoke-virtual {p1, v4, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v4

    iput v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->d:I

    goto :goto_3be

    .line 152
    :pswitch_36c
    iget v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->c:F

    invoke-virtual {p1, v4, v5}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v4

    iput v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->c:F

    goto :goto_3be

    .line 153
    :pswitch_375
    iget v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->b:I

    invoke-virtual {p1, v4, v5}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v4

    iput v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->b:I

    goto :goto_3be

    .line 154
    :pswitch_37e
    iget v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->a:I

    invoke-virtual {p1, v4, v5}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v4

    iput v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->a:I

    goto :goto_3be

    .line 155
    :pswitch_387
    iget v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->o:F

    invoke-virtual {p1, v4, v5}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v4

    const/high16 v5, 0x43b40000    # 360.0f

    rem-float/2addr v4, v5

    iput v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->o:F

    cmpg-float v7, v4, v3

    if-gez v7, :cond_3be

    sub-float v4, v5, v4

    rem-float/2addr v4, v5

    .line 156
    iput v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->o:F

    goto :goto_3be

    .line 157
    :pswitch_39c
    iget v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->n:I

    invoke-virtual {p1, v4, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    iput v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->n:I

    goto :goto_3be

    .line 158
    :pswitch_3a5
    iget v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->m:I

    invoke-virtual {p1, v4, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v5

    iput v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->m:I

    if-ne v5, v0, :cond_3be

    .line 159
    invoke-virtual {p1, v4, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v4

    iput v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->m:I

    goto :goto_3be

    .line 160
    :pswitch_3b6
    iget v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->R:I

    invoke-virtual {p1, v4, v5}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v4

    iput v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->R:I

    :catch_3be
    :cond_3be
    :goto_3be
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_9a

    .line 161
    :cond_3c2
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 162
    invoke-virtual {p0}, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->c()V

    return-void

    nop

    :pswitch_data_3ca
    .packed-switch 0x1
        :pswitch_3b6
        :pswitch_3a5
        :pswitch_39c
        :pswitch_387
        :pswitch_37e
        :pswitch_375
        :pswitch_36c
        :pswitch_35b
        :pswitch_34a
        :pswitch_338
        :pswitch_326
        :pswitch_314
        :pswitch_302
        :pswitch_2f0
        :pswitch_2de
        :pswitch_2cc
        :pswitch_2ba
        :pswitch_2a8
        :pswitch_296
        :pswitch_284
        :pswitch_27a
        :pswitch_270
        :pswitch_266
        :pswitch_25c
        :pswitch_252
        :pswitch_248
        :pswitch_23e
        :pswitch_234
        :pswitch_22a
        :pswitch_220
        :pswitch_211
        :pswitch_202
        :pswitch_1eb
        :pswitch_1d4
        :pswitch_1c4
        :pswitch_1ad
        :pswitch_196
        :pswitch_186
    .end packed-switch

    :pswitch_data_41a
    .packed-switch 0x2c
        :pswitch_f2
        :pswitch_e8
        :pswitch_de
        :pswitch_d6
        :pswitch_ce
        :pswitch_c4
        :pswitch_ba
        :pswitch_b2
    .end packed-switch
.end method

.method public constructor <init>(Landroid/view/ViewGroup$LayoutParams;)V
    .registers 7

    .line 226
    invoke-direct {p0, p1}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    const/4 p1, -0x1

    .line 227
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->a:I

    .line 228
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->b:I

    const/high16 v0, -0x40800000    # -1.0f

    .line 229
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->c:F

    .line 230
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->d:I

    .line 231
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->e:I

    .line 232
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->f:I

    .line 233
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->g:I

    .line 234
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->h:I

    .line 235
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->i:I

    .line 236
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->j:I

    .line 237
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->k:I

    .line 238
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->l:I

    .line 239
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->m:I

    const/4 v1, 0x0

    .line 240
    iput v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->n:I

    const/4 v2, 0x0

    .line 241
    iput v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->o:F

    .line 242
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->p:I

    .line 243
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->q:I

    .line 244
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->r:I

    .line 245
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->s:I

    .line 246
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->t:I

    .line 247
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->u:I

    .line 248
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->v:I

    .line 249
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->w:I

    .line 250
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->x:I

    .line 251
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->y:I

    const/high16 v2, 0x3f000000    # 0.5f

    .line 252
    iput v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->z:F

    .line 253
    iput v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->A:F

    const/4 v3, 0x0

    .line 254
    iput-object v3, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->B:Ljava/lang/String;

    const/4 v4, 0x1

    .line 255
    iput v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->C:I

    .line 256
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->D:F

    .line 257
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->E:F

    .line 258
    iput v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->F:I

    .line 259
    iput v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->G:I

    .line 260
    iput v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->H:I

    .line 261
    iput v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->I:I

    .line 262
    iput v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->J:I

    .line 263
    iput v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->K:I

    .line 264
    iput v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->L:I

    .line 265
    iput v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->M:I

    const/high16 v0, 0x3f800000    # 1.0f

    .line 266
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->N:F

    .line 267
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->O:F

    .line 268
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->P:I

    .line 269
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->Q:I

    .line 270
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->R:I

    .line 271
    iput-boolean v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->S:Z

    .line 272
    iput-boolean v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->T:Z

    .line 273
    iput-object v3, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->U:Ljava/lang/String;

    .line 274
    iput-boolean v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->V:Z

    .line 275
    iput-boolean v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->W:Z

    .line 276
    iput-boolean v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->X:Z

    .line 277
    iput-boolean v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->Y:Z

    .line 278
    iput-boolean v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->Z:Z

    .line 279
    iput-boolean v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->a0:Z

    .line 280
    iput-boolean v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->b0:Z

    .line 281
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->c0:I

    .line 282
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->d0:I

    .line 283
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->e0:I

    .line 284
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->f0:I

    .line 285
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->g0:I

    .line 286
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->h0:I

    .line 287
    iput v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->i0:F

    .line 288
    new-instance p1, Lb/f/b/k/e;

    invoke-direct {p1}, Lb/f/b/k/e;-><init>()V

    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->m0:Lb/f/b/k/e;

    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->U:Ljava/lang/String;

    return-object v0
.end method

.method public b()Lb/f/b/k/e;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->m0:Lb/f/b/k/e;

    return-object v0
.end method

.method public c()V
    .registers 6

    const/4 v0, 0x0

    .line 1
    iput-boolean v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->Y:Z

    const/4 v1, 0x1

    .line 2
    iput-boolean v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->V:Z

    .line 3
    iput-boolean v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->W:Z

    .line 4
    iget v2, p0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    const/4 v3, -0x2

    if-ne v2, v3, :cond_19

    iget-boolean v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->S:Z

    if-eqz v2, :cond_19

    .line 5
    iput-boolean v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->V:Z

    .line 6
    iget v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->H:I

    if-nez v2, :cond_19

    .line 7
    iput v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->H:I

    .line 8
    :cond_19
    iget v2, p0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    if-ne v2, v3, :cond_29

    iget-boolean v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->T:Z

    if-eqz v2, :cond_29

    .line 9
    iput-boolean v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->W:Z

    .line 10
    iget v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->I:I

    if-nez v2, :cond_29

    .line 11
    iput v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->I:I

    .line 12
    :cond_29
    iget v2, p0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    const/4 v4, -0x1

    if-eqz v2, :cond_30

    if-ne v2, v4, :cond_3e

    .line 13
    :cond_30
    iput-boolean v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->V:Z

    .line 14
    iget v2, p0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    if-nez v2, :cond_3e

    iget v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->H:I

    if-ne v2, v1, :cond_3e

    .line 15
    iput v3, p0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 16
    iput-boolean v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->S:Z

    .line 17
    :cond_3e
    iget v2, p0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    if-eqz v2, :cond_44

    if-ne v2, v4, :cond_52

    .line 18
    :cond_44
    iput-boolean v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->W:Z

    .line 19
    iget v0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    if-nez v0, :cond_52

    iget v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->I:I

    if-ne v0, v1, :cond_52

    .line 20
    iput v3, p0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 21
    iput-boolean v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->T:Z

    .line 22
    :cond_52
    iget v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->c:F

    const/high16 v2, -0x40800000    # -1.0f

    cmpl-float v0, v0, v2

    if-nez v0, :cond_62

    iget v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->a:I

    if-ne v0, v4, :cond_62

    iget v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->b:I

    if-eq v0, v4, :cond_7e

    .line 23
    :cond_62
    iput-boolean v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->Y:Z

    .line 24
    iput-boolean v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->V:Z

    .line 25
    iput-boolean v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->W:Z

    .line 26
    iget-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->m0:Lb/f/b/k/e;

    instance-of v0, v0, Lb/f/b/k/h;

    if-nez v0, :cond_75

    .line 27
    new-instance v0, Lb/f/b/k/h;

    invoke-direct {v0}, Lb/f/b/k/h;-><init>()V

    iput-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->m0:Lb/f/b/k/e;

    .line 28
    :cond_75
    iget-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->m0:Lb/f/b/k/e;

    check-cast v0, Lb/f/b/k/h;

    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->R:I

    invoke-virtual {v0, v1}, Lb/f/b/k/h;->v(I)V

    :cond_7e
    return-void
.end method

.method public resolveLayoutDirection(I)V
    .registers 8
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .line 1
    iget v0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 2
    iget v1, p0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 3
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    const/16 v5, 0x11

    if-lt v2, v5, :cond_17

    .line 4
    invoke-super {p0, p1}, Landroid/view/ViewGroup$MarginLayoutParams;->resolveLayoutDirection(I)V

    .line 5
    invoke-virtual {p0}, Landroid/view/ViewGroup$MarginLayoutParams;->getLayoutDirection()I

    move-result p1

    if-ne v4, p1, :cond_17

    const/4 p1, 0x1

    goto :goto_18

    :cond_17
    const/4 p1, 0x0

    :goto_18
    const/4 v2, -0x1

    .line 6
    iput v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->e0:I

    .line 7
    iput v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->f0:I

    .line 8
    iput v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->c0:I

    .line 9
    iput v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->d0:I

    .line 10
    iput v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->g0:I

    .line 11
    iput v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->h0:I

    .line 12
    iget v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->t:I

    iput v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->g0:I

    .line 13
    iget v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->v:I

    iput v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->h0:I

    .line 14
    iget v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->z:F

    iput v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->i0:F

    .line 15
    iget v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->a:I

    iput v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->j0:I

    .line 16
    iget v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->b:I

    iput v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->k0:I

    .line 17
    iget v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->c:F

    iput v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->l0:F

    if-eqz p1, :cond_a0

    .line 18
    iget p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->p:I

    if-eq p1, v2, :cond_47

    .line 19
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->e0:I

    :goto_45
    const/4 v3, 0x1

    goto :goto_4e

    .line 20
    :cond_47
    iget p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->q:I

    if-eq p1, v2, :cond_4e

    .line 21
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->f0:I

    goto :goto_45

    .line 22
    :cond_4e
    :goto_4e
    iget p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->r:I

    if-eq p1, v2, :cond_55

    .line 23
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->d0:I

    const/4 v3, 0x1

    .line 24
    :cond_55
    iget p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->s:I

    if-eq p1, v2, :cond_5c

    .line 25
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->c0:I

    const/4 v3, 0x1

    .line 26
    :cond_5c
    iget p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->x:I

    if-eq p1, v2, :cond_62

    .line 27
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->h0:I

    .line 28
    :cond_62
    iget p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->y:I

    if-eq p1, v2, :cond_68

    .line 29
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->g0:I

    :cond_68
    const/high16 p1, 0x3f800000    # 1.0f

    if-eqz v3, :cond_72

    .line 30
    iget v3, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->z:F

    sub-float v3, p1, v3

    iput v3, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->i0:F

    .line 31
    :cond_72
    iget-boolean v3, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->Y:Z

    if-eqz v3, :cond_c4

    iget v3, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->R:I

    if-ne v3, v4, :cond_c4

    .line 32
    iget v3, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->c:F

    const/high16 v4, -0x40800000    # -1.0f

    cmpl-float v5, v3, v4

    if-eqz v5, :cond_8a

    sub-float/2addr p1, v3

    .line 33
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->l0:F

    .line 34
    iput v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->j0:I

    .line 35
    iput v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->k0:I

    goto :goto_c4

    .line 36
    :cond_8a
    iget p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->a:I

    if-eq p1, v2, :cond_95

    .line 37
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->k0:I

    .line 38
    iput v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->j0:I

    .line 39
    iput v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->l0:F

    goto :goto_c4

    .line 40
    :cond_95
    iget p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->b:I

    if-eq p1, v2, :cond_c4

    .line 41
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->j0:I

    .line 42
    iput v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->k0:I

    .line 43
    iput v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->l0:F

    goto :goto_c4

    .line 44
    :cond_a0
    iget p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->p:I

    if-eq p1, v2, :cond_a6

    .line 45
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->d0:I

    .line 46
    :cond_a6
    iget p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->q:I

    if-eq p1, v2, :cond_ac

    .line 47
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->c0:I

    .line 48
    :cond_ac
    iget p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->r:I

    if-eq p1, v2, :cond_b2

    .line 49
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->e0:I

    .line 50
    :cond_b2
    iget p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->s:I

    if-eq p1, v2, :cond_b8

    .line 51
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->f0:I

    .line 52
    :cond_b8
    iget p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->x:I

    if-eq p1, v2, :cond_be

    .line 53
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->g0:I

    .line 54
    :cond_be
    iget p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->y:I

    if-eq p1, v2, :cond_c4

    .line 55
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->h0:I

    .line 56
    :cond_c4
    :goto_c4
    iget p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->r:I

    if-ne p1, v2, :cond_10e

    iget p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->s:I

    if-ne p1, v2, :cond_10e

    iget p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->q:I

    if-ne p1, v2, :cond_10e

    iget p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->p:I

    if-ne p1, v2, :cond_10e

    .line 57
    iget p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->f:I

    if-eq p1, v2, :cond_e3

    .line 58
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->e0:I

    .line 59
    iget p1, p0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    if-gtz p1, :cond_f1

    if-lez v1, :cond_f1

    .line 60
    iput v1, p0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    goto :goto_f1

    .line 61
    :cond_e3
    iget p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->g:I

    if-eq p1, v2, :cond_f1

    .line 62
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->f0:I

    .line 63
    iget p1, p0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    if-gtz p1, :cond_f1

    if-lez v1, :cond_f1

    .line 64
    iput v1, p0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 65
    :cond_f1
    :goto_f1
    iget p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->d:I

    if-eq p1, v2, :cond_100

    .line 66
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->c0:I

    .line 67
    iget p1, p0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    if-gtz p1, :cond_10e

    if-lez v0, :cond_10e

    .line 68
    iput v0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    goto :goto_10e

    .line 69
    :cond_100
    iget p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->e:I

    if-eq p1, v2, :cond_10e

    .line 70
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->d0:I

    .line 71
    iget p1, p0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    if-gtz p1, :cond_10e

    if-lez v0, :cond_10e

    .line 72
    iput v0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    :cond_10e
    :goto_10e
    return-void
.end method
