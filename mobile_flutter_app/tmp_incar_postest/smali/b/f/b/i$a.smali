.class public final enum Lb/f/b/i$a;
.super Ljava/lang/Enum;
.source "SolverVariable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/f/b/i;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lb/f/b/i$a;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum CONSTANT:Lb/f/b/i$a;

.field public static final enum ERROR:Lb/f/b/i$a;

.field public static final enum SLACK:Lb/f/b/i$a;

.field public static final enum UNKNOWN:Lb/f/b/i$a;

.field public static final enum UNRESTRICTED:Lb/f/b/i$a;

.field public static final synthetic h:[Lb/f/b/i$a;


# direct methods
.method public static constructor <clinit>()V
    .registers 8

    .line 1
    new-instance v0, Lb/f/b/i$a;

    const/4 v1, 0x0

    const-string v2, "UNRESTRICTED"

    invoke-direct {v0, v2, v1}, Lb/f/b/i$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lb/f/b/i$a;->UNRESTRICTED:Lb/f/b/i$a;

    .line 2
    new-instance v0, Lb/f/b/i$a;

    const/4 v2, 0x1

    const-string v3, "CONSTANT"

    invoke-direct {v0, v3, v2}, Lb/f/b/i$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lb/f/b/i$a;->CONSTANT:Lb/f/b/i$a;

    .line 3
    new-instance v0, Lb/f/b/i$a;

    const/4 v3, 0x2

    const-string v4, "SLACK"

    invoke-direct {v0, v4, v3}, Lb/f/b/i$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lb/f/b/i$a;->SLACK:Lb/f/b/i$a;

    .line 4
    new-instance v0, Lb/f/b/i$a;

    const/4 v4, 0x3

    const-string v5, "ERROR"

    invoke-direct {v0, v5, v4}, Lb/f/b/i$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lb/f/b/i$a;->ERROR:Lb/f/b/i$a;

    .line 5
    new-instance v0, Lb/f/b/i$a;

    const/4 v5, 0x4

    const-string v6, "UNKNOWN"

    invoke-direct {v0, v6, v5}, Lb/f/b/i$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lb/f/b/i$a;->UNKNOWN:Lb/f/b/i$a;

    const/4 v6, 0x5

    new-array v6, v6, [Lb/f/b/i$a;

    .line 6
    sget-object v7, Lb/f/b/i$a;->UNRESTRICTED:Lb/f/b/i$a;

    aput-object v7, v6, v1

    sget-object v1, Lb/f/b/i$a;->CONSTANT:Lb/f/b/i$a;

    aput-object v1, v6, v2

    sget-object v1, Lb/f/b/i$a;->SLACK:Lb/f/b/i$a;

    aput-object v1, v6, v3

    sget-object v1, Lb/f/b/i$a;->ERROR:Lb/f/b/i$a;

    aput-object v1, v6, v4

    aput-object v0, v6, v5

    sput-object v6, Lb/f/b/i$a;->h:[Lb/f/b/i$a;

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

.method public static valueOf(Ljava/lang/String;)Lb/f/b/i$a;
    .registers 2

    .line 1
    const-class v0, Lb/f/b/i$a;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lb/f/b/i$a;

    return-object p0
.end method

.method public static values()[Lb/f/b/i$a;
    .registers 1

    .line 1
    sget-object v0, Lb/f/b/i$a;->h:[Lb/f/b/i$a;

    invoke-virtual {v0}, [Lb/f/b/i$a;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lb/f/b/i$a;

    return-object v0
.end method
