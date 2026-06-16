.class public abstract Lb/n/r$b;
.super Lb/n/r$c;
.source "ViewModelProvider.java"

# interfaces
.implements Lb/n/r$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/n/r;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "b"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Lb/n/r$c;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Class;)Lb/n/q;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lb/n/q;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 1
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string v0, "create(String, Class<?>) must be called on implementaions of KeyedFactory"

    invoke-direct {p1, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public abstract a(Ljava/lang/String;Ljava/lang/Class;)Lb/n/q;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lb/n/q;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation
.end method
