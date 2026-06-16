.class public Lc/a/a/a/v/c$c;
.super Landroid/util/Property;
.source "CircularRevealWidget.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lc/a/a/a/v/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/util/Property<",
        "Lc/a/a/a/v/c;",
        "Lc/a/a/a/v/c$e;",
        ">;"
    }
.end annotation


# static fields
.field public static final a:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property<",
            "Lc/a/a/a/v/c;",
            "Lc/a/a/a/v/c$e;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static constructor <clinit>()V
    .registers 2

    .line 1
    new-instance v0, Lc/a/a/a/v/c$c;

    const-string v1, "circularReveal"

    invoke-direct {v0, v1}, Lc/a/a/a/v/c$c;-><init>(Ljava/lang/String;)V

    sput-object v0, Lc/a/a/a/v/c$c;->a:Landroid/util/Property;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3

    .line 1
    const-class v0, Lc/a/a/a/v/c$e;

    invoke-direct {p0, v0, p1}, Landroid/util/Property;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public a(Lc/a/a/a/v/c;)Lc/a/a/a/v/c$e;
    .registers 2

    .line 1
    invoke-interface {p1}, Lc/a/a/a/v/c;->getRevealInfo()Lc/a/a/a/v/c$e;

    move-result-object p1

    return-object p1
.end method

.method public a(Lc/a/a/a/v/c;Lc/a/a/a/v/c$e;)V
    .registers 3

    .line 2
    invoke-interface {p1, p2}, Lc/a/a/a/v/c;->setRevealInfo(Lc/a/a/a/v/c$e;)V

    return-void
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    .line 1
    check-cast p1, Lc/a/a/a/v/c;

    invoke-virtual {p0, p1}, Lc/a/a/a/v/c$c;->a(Lc/a/a/a/v/c;)Lc/a/a/a/v/c$e;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic set(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 3

    .line 1
    check-cast p1, Lc/a/a/a/v/c;

    check-cast p2, Lc/a/a/a/v/c$e;

    invoke-virtual {p0, p1, p2}, Lc/a/a/a/v/c$c;->a(Lc/a/a/a/v/c;Lc/a/a/a/v/c$e;)V

    return-void
.end method
