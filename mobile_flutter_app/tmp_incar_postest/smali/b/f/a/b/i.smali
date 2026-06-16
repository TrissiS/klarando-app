.class public Lb/f/a/b/i;
.super Lb/f/a/b/j;
.source "KeyPosition.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/f/a/b/i$a;
    }
.end annotation


# instance fields
.field public g:Ljava/lang/String;

.field public h:I

.field public i:I

.field public j:F

.field public k:F

.field public l:F

.field public m:F

.field public n:F

.field public o:F

.field public p:I


# direct methods
.method public constructor <init>()V
    .registers 3

    .line 1
    invoke-direct {p0}, Lb/f/a/b/j;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lb/f/a/b/i;->g:Ljava/lang/String;

    .line 3
    sget v0, Lb/f/a/b/c;->e:I

    iput v0, p0, Lb/f/a/b/i;->h:I

    const/4 v0, 0x0

    .line 4
    iput v0, p0, Lb/f/a/b/i;->i:I

    const/high16 v1, 0x7fc00000    # Float.NaN

    .line 5
    iput v1, p0, Lb/f/a/b/i;->j:F

    .line 6
    iput v1, p0, Lb/f/a/b/i;->k:F

    .line 7
    iput v1, p0, Lb/f/a/b/i;->l:F

    .line 8
    iput v1, p0, Lb/f/a/b/i;->m:F

    .line 9
    iput v1, p0, Lb/f/a/b/i;->n:F

    .line 10
    iput v1, p0, Lb/f/a/b/i;->o:F

    .line 11
    iput v0, p0, Lb/f/a/b/i;->p:I

    return-void
.end method


# virtual methods
.method public a(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    .line 1
    sget-object v0, Lb/f/c/f;->KeyPosition:[I

    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 2
    invoke-static {p0, p1}, Lb/f/a/b/i$a;->a(Lb/f/a/b/i;Landroid/content/res/TypedArray;)V

    return-void
.end method

.method public a(Ljava/util/HashMap;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lb/f/a/b/r;",
            ">;)V"
        }
    .end annotation

    return-void
.end method
