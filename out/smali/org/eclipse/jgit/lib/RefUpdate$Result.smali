.class public final enum Lorg/eclipse/jgit/lib/RefUpdate$Result;
.super Ljava/lang/Enum;
.source "RefUpdate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/lib/RefUpdate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Result"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/eclipse/jgit/lib/RefUpdate$Result;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/eclipse/jgit/lib/RefUpdate$Result;

.field public static final enum FAST_FORWARD:Lorg/eclipse/jgit/lib/RefUpdate$Result;

.field public static final enum FORCED:Lorg/eclipse/jgit/lib/RefUpdate$Result;

.field public static final enum IO_FAILURE:Lorg/eclipse/jgit/lib/RefUpdate$Result;

.field public static final enum LOCK_FAILURE:Lorg/eclipse/jgit/lib/RefUpdate$Result;

.field public static final enum NEW:Lorg/eclipse/jgit/lib/RefUpdate$Result;

.field public static final enum NOT_ATTEMPTED:Lorg/eclipse/jgit/lib/RefUpdate$Result;

.field public static final enum NO_CHANGE:Lorg/eclipse/jgit/lib/RefUpdate$Result;

.field public static final enum REJECTED:Lorg/eclipse/jgit/lib/RefUpdate$Result;

.field public static final enum REJECTED_CURRENT_BRANCH:Lorg/eclipse/jgit/lib/RefUpdate$Result;

.field public static final enum RENAMED:Lorg/eclipse/jgit/lib/RefUpdate$Result;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 63
    new-instance v0, Lorg/eclipse/jgit/lib/RefUpdate$Result;

    const-string v1, "NOT_ATTEMPTED"

    invoke-direct {v0, v1, v3}, Lorg/eclipse/jgit/lib/RefUpdate$Result;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/lib/RefUpdate$Result;->NOT_ATTEMPTED:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    .line 73
    new-instance v0, Lorg/eclipse/jgit/lib/RefUpdate$Result;

    const-string v1, "LOCK_FAILURE"

    invoke-direct {v0, v1, v4}, Lorg/eclipse/jgit/lib/RefUpdate$Result;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/lib/RefUpdate$Result;->LOCK_FAILURE:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    .line 81
    new-instance v0, Lorg/eclipse/jgit/lib/RefUpdate$Result;

    const-string v1, "NO_CHANGE"

    invoke-direct {v0, v1, v5}, Lorg/eclipse/jgit/lib/RefUpdate$Result;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/lib/RefUpdate$Result;->NO_CHANGE:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    .line 89
    new-instance v0, Lorg/eclipse/jgit/lib/RefUpdate$Result;

    const-string v1, "NEW"

    invoke-direct {v0, v1, v6}, Lorg/eclipse/jgit/lib/RefUpdate$Result;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/lib/RefUpdate$Result;->NEW:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    .line 99
    new-instance v0, Lorg/eclipse/jgit/lib/RefUpdate$Result;

    const-string v1, "FORCED"

    invoke-direct {v0, v1, v7}, Lorg/eclipse/jgit/lib/RefUpdate$Result;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/lib/RefUpdate$Result;->FORCED:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    .line 107
    new-instance v0, Lorg/eclipse/jgit/lib/RefUpdate$Result;

    const-string v1, "FAST_FORWARD"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/lib/RefUpdate$Result;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/lib/RefUpdate$Result;->FAST_FORWARD:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    .line 117
    new-instance v0, Lorg/eclipse/jgit/lib/RefUpdate$Result;

    const-string v1, "REJECTED"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/lib/RefUpdate$Result;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/lib/RefUpdate$Result;->REJECTED:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    .line 124
    new-instance v0, Lorg/eclipse/jgit/lib/RefUpdate$Result;

    const-string v1, "REJECTED_CURRENT_BRANCH"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/lib/RefUpdate$Result;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/lib/RefUpdate$Result;->REJECTED_CURRENT_BRANCH:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    .line 135
    new-instance v0, Lorg/eclipse/jgit/lib/RefUpdate$Result;

    const-string v1, "IO_FAILURE"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/lib/RefUpdate$Result;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/lib/RefUpdate$Result;->IO_FAILURE:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    .line 141
    new-instance v0, Lorg/eclipse/jgit/lib/RefUpdate$Result;

    const-string v1, "RENAMED"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/lib/RefUpdate$Result;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/lib/RefUpdate$Result;->RENAMED:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    .line 61
    const/16 v0, 0xa

    new-array v0, v0, [Lorg/eclipse/jgit/lib/RefUpdate$Result;

    sget-object v1, Lorg/eclipse/jgit/lib/RefUpdate$Result;->NOT_ATTEMPTED:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    aput-object v1, v0, v3

    sget-object v1, Lorg/eclipse/jgit/lib/RefUpdate$Result;->LOCK_FAILURE:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    aput-object v1, v0, v4

    sget-object v1, Lorg/eclipse/jgit/lib/RefUpdate$Result;->NO_CHANGE:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    aput-object v1, v0, v5

    sget-object v1, Lorg/eclipse/jgit/lib/RefUpdate$Result;->NEW:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    aput-object v1, v0, v6

    sget-object v1, Lorg/eclipse/jgit/lib/RefUpdate$Result;->FORCED:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lorg/eclipse/jgit/lib/RefUpdate$Result;->FAST_FORWARD:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lorg/eclipse/jgit/lib/RefUpdate$Result;->REJECTED:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lorg/eclipse/jgit/lib/RefUpdate$Result;->REJECTED_CURRENT_BRANCH:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lorg/eclipse/jgit/lib/RefUpdate$Result;->IO_FAILURE:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lorg/eclipse/jgit/lib/RefUpdate$Result;->RENAMED:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    aput-object v2, v0, v1

    sput-object v0, Lorg/eclipse/jgit/lib/RefUpdate$Result;->$VALUES:[Lorg/eclipse/jgit/lib/RefUpdate$Result;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 61
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/eclipse/jgit/lib/RefUpdate$Result;
    .locals 1
    .parameter "name"

    .prologue
    .line 61
    const-class v0, Lorg/eclipse/jgit/lib/RefUpdate$Result;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/lib/RefUpdate$Result;

    return-object v0
.end method

.method public static values()[Lorg/eclipse/jgit/lib/RefUpdate$Result;
    .locals 1

    .prologue
    .line 61
    sget-object v0, Lorg/eclipse/jgit/lib/RefUpdate$Result;->$VALUES:[Lorg/eclipse/jgit/lib/RefUpdate$Result;

    invoke-virtual {v0}, [Lorg/eclipse/jgit/lib/RefUpdate$Result;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/eclipse/jgit/lib/RefUpdate$Result;

    return-object v0
.end method
