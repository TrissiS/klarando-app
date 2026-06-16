.class public final Lb/o/a/b$c$a;
.super Ljava/lang/Object;
.source "LoaderManagerImpl.java"

# interfaces
.implements Lb/n/r$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/o/a/b$c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Class;)Lb/n/q;
    .registers 2
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
    new-instance p1, Lb/o/a/b$c;

    invoke-direct {p1}, Lb/o/a/b$c;-><init>()V

    return-object p1
.end method
