.class public Lb/f/b/c;
.super Ljava/lang/Object;
.source "Cache.java"


# instance fields
.field public a:Lb/f/b/f;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lb/f/b/f<",
            "Lb/f/b/b;",
            ">;"
        }
    .end annotation
.end field

.field public b:Lb/f/b/f;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lb/f/b/f<",
            "Lb/f/b/b;",
            ">;"
        }
    .end annotation
.end field

.field public c:Lb/f/b/f;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lb/f/b/f<",
            "Lb/f/b/i;",
            ">;"
        }
    .end annotation
.end field

.field public d:[Lb/f/b/i;


# direct methods
.method public constructor <init>()V
    .registers 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Lb/f/b/g;

    const/16 v1, 0x100

    invoke-direct {v0, v1}, Lb/f/b/g;-><init>(I)V

    iput-object v0, p0, Lb/f/b/c;->a:Lb/f/b/f;

    .line 3
    new-instance v0, Lb/f/b/g;

    invoke-direct {v0, v1}, Lb/f/b/g;-><init>(I)V

    iput-object v0, p0, Lb/f/b/c;->b:Lb/f/b/f;

    .line 4
    new-instance v0, Lb/f/b/g;

    invoke-direct {v0, v1}, Lb/f/b/g;-><init>(I)V

    iput-object v0, p0, Lb/f/b/c;->c:Lb/f/b/f;

    const/16 v0, 0x20

    new-array v0, v0, [Lb/f/b/i;

    .line 5
    iput-object v0, p0, Lb/f/b/c;->d:[Lb/f/b/i;

    return-void
.end method
