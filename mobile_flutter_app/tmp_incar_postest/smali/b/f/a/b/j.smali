.class public abstract Lb/f/a/b/j;
.super Lb/f/a/b/c;
.source "KeyPositionBase.java"


# instance fields
.field public f:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Lb/f/a/b/c;-><init>()V

    .line 2
    sget v0, Lb/f/a/b/c;->e:I

    iput v0, p0, Lb/f/a/b/j;->f:I

    return-void
.end method


# virtual methods
.method public a(Ljava/util/HashSet;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    return-void
.end method
