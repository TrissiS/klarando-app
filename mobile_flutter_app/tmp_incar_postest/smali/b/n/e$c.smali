.class public final enum Lb/n/e$c;
.super Ljava/lang/Enum;
.source "Lifecycle.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/n/e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lb/n/e$c;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum CREATED:Lb/n/e$c;

.field public static final enum DESTROYED:Lb/n/e$c;

.field public static final enum INITIALIZED:Lb/n/e$c;

.field public static final enum RESUMED:Lb/n/e$c;

.field public static final enum STARTED:Lb/n/e$c;

.field public static final synthetic h:[Lb/n/e$c;


# direct methods
.method public static constructor <clinit>()V
    .registers 8

    .line 1
    new-instance v0, Lb/n/e$c;

    const/4 v1, 0x0

    const-string v2, "DESTROYED"

    invoke-direct {v0, v2, v1}, Lb/n/e$c;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lb/n/e$c;->DESTROYED:Lb/n/e$c;

    .line 2
    new-instance v0, Lb/n/e$c;

    const/4 v2, 0x1

    const-string v3, "INITIALIZED"

    invoke-direct {v0, v3, v2}, Lb/n/e$c;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lb/n/e$c;->INITIALIZED:Lb/n/e$c;

    .line 3
    new-instance v0, Lb/n/e$c;

    const/4 v3, 0x2

    const-string v4, "CREATED"

    invoke-direct {v0, v4, v3}, Lb/n/e$c;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lb/n/e$c;->CREATED:Lb/n/e$c;

    .line 4
    new-instance v0, Lb/n/e$c;

    const/4 v4, 0x3

    const-string v5, "STARTED"

    invoke-direct {v0, v5, v4}, Lb/n/e$c;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lb/n/e$c;->STARTED:Lb/n/e$c;

    .line 5
    new-instance v0, Lb/n/e$c;

    const/4 v5, 0x4

    const-string v6, "RESUMED"

    invoke-direct {v0, v6, v5}, Lb/n/e$c;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lb/n/e$c;->RESUMED:Lb/n/e$c;

    const/4 v6, 0x5

    new-array v6, v6, [Lb/n/e$c;

    .line 6
    sget-object v7, Lb/n/e$c;->DESTROYED:Lb/n/e$c;

    aput-object v7, v6, v1

    sget-object v1, Lb/n/e$c;->INITIALIZED:Lb/n/e$c;

    aput-object v1, v6, v2

    sget-object v1, Lb/n/e$c;->CREATED:Lb/n/e$c;

    aput-object v1, v6, v3

    sget-object v1, Lb/n/e$c;->STARTED:Lb/n/e$c;

    aput-object v1, v6, v4

    aput-object v0, v6, v5

    sput-object v6, Lb/n/e$c;->h:[Lb/n/e$c;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lb/n/e$c;
    .registers 2

    .line 1
    const-class v0, Lb/n/e$c;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lb/n/e$c;

    return-object p0
.end method

.method public static values()[Lb/n/e$c;
    .registers 1

    .line 1
    sget-object v0, Lb/n/e$c;->h:[Lb/n/e$c;

    invoke-virtual {v0}, [Lb/n/e$c;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lb/n/e$c;

    return-object v0
.end method


# virtual methods
.method public isAtLeast(Lb/n/e$c;)Z
    .registers 2

    .line 1
    invoke-virtual {p0, p1}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result p1

    if-ltz p1, :cond_8

    const/4 p1, 0x1

    goto :goto_9

    :cond_8
    const/4 p1, 0x0

    :goto_9
    return p1
.end method
