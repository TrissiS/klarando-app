.class public Lb/s/z;
.super Ljava/lang/Object;
.source "TransitionValuesMaps.java"


# instance fields
.field public final a:Lb/e/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lb/e/a<",
            "Landroid/view/View;",
            "Lb/s/y;",
            ">;"
        }
    .end annotation
.end field

.field public final b:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public final c:Lb/e/d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lb/e/d<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public final d:Lb/e/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lb/e/a<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
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
    new-instance v0, Lb/e/a;

    invoke-direct {v0}, Lb/e/a;-><init>()V

    iput-object v0, p0, Lb/s/z;->a:Lb/e/a;

    .line 3
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lb/s/z;->b:Landroid/util/SparseArray;

    .line 4
    new-instance v0, Lb/e/d;

    invoke-direct {v0}, Lb/e/d;-><init>()V

    iput-object v0, p0, Lb/s/z;->c:Lb/e/d;

    .line 5
    new-instance v0, Lb/e/a;

    invoke-direct {v0}, Lb/e/a;-><init>()V

    iput-object v0, p0, Lb/s/z;->d:Lb/e/a;

    return-void
.end method
