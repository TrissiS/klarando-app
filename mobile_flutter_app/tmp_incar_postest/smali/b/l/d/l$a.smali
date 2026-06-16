.class public Lb/l/d/l$a;
.super Ljava/lang/Object;
.source "FragmentManagerViewModel.java"

# interfaces
.implements Lb/n/r$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/l/d/l;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
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
    new-instance p1, Lb/l/d/l;

    const/4 v0, 0x1

    invoke-direct {p1, v0}, Lb/l/d/l;-><init>(Z)V

    return-object p1
.end method
