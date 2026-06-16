.class public abstract Lb/o/a/a;
.super Ljava/lang/Object;
.source "LoaderManager.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static a(Lb/n/h;)Lb/o/a/a;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lb/n/h;",
            ":",
            "Lb/n/t;",
            ">(TT;)",
            "Lb/o/a/a;"
        }
    .end annotation

    .line 1
    new-instance v0, Lb/o/a/b;

    move-object v1, p0

    check-cast v1, Lb/n/t;

    invoke-interface {v1}, Lb/n/t;->g()Lb/n/s;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lb/o/a/b;-><init>(Lb/n/h;Lb/n/s;)V

    return-object v0
.end method


# virtual methods
.method public abstract a()V
.end method

.method public abstract a(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method
