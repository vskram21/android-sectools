.class public abstract enum Lorg/eclipse/jgit/lib/RepositoryState;
.super Ljava/lang/Enum;
.source "RepositoryState.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/eclipse/jgit/lib/RepositoryState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/eclipse/jgit/lib/RepositoryState;

.field public static final enum APPLY:Lorg/eclipse/jgit/lib/RepositoryState;

.field public static final enum BARE:Lorg/eclipse/jgit/lib/RepositoryState;

.field public static final enum BISECTING:Lorg/eclipse/jgit/lib/RepositoryState;

.field public static final enum CHERRY_PICKING:Lorg/eclipse/jgit/lib/RepositoryState;

.field public static final enum CHERRY_PICKING_RESOLVED:Lorg/eclipse/jgit/lib/RepositoryState;

.field public static final enum MERGING:Lorg/eclipse/jgit/lib/RepositoryState;

.field public static final enum MERGING_RESOLVED:Lorg/eclipse/jgit/lib/RepositoryState;

.field public static final enum REBASING:Lorg/eclipse/jgit/lib/RepositoryState;

.field public static final enum REBASING_INTERACTIVE:Lorg/eclipse/jgit/lib/RepositoryState;

.field public static final enum REBASING_MERGE:Lorg/eclipse/jgit/lib/RepositoryState;

.field public static final enum REBASING_REBASING:Lorg/eclipse/jgit/lib/RepositoryState;

.field public static final enum REVERTING:Lorg/eclipse/jgit/lib/RepositoryState;

.field public static final enum REVERTING_RESOLVED:Lorg/eclipse/jgit/lib/RepositoryState;

.field public static final enum SAFE:Lorg/eclipse/jgit/lib/RepositoryState;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 59
    new-instance v0, Lorg/eclipse/jgit/lib/RepositoryState$1;

    const-string v1, "BARE"

    invoke-direct {v0, v1, v3}, Lorg/eclipse/jgit/lib/RepositoryState$1;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/lib/RepositoryState;->BARE:Lorg/eclipse/jgit/lib/RepositoryState;

    .line 82
    new-instance v0, Lorg/eclipse/jgit/lib/RepositoryState$2;

    const-string v1, "SAFE"

    invoke-direct {v0, v1, v4}, Lorg/eclipse/jgit/lib/RepositoryState$2;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/lib/RepositoryState;->SAFE:Lorg/eclipse/jgit/lib/RepositoryState;

    .line 104
    new-instance v0, Lorg/eclipse/jgit/lib/RepositoryState$3;

    const-string v1, "MERGING"

    invoke-direct {v0, v1, v5}, Lorg/eclipse/jgit/lib/RepositoryState$3;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/lib/RepositoryState;->MERGING:Lorg/eclipse/jgit/lib/RepositoryState;

    .line 128
    new-instance v0, Lorg/eclipse/jgit/lib/RepositoryState$4;

    const-string v1, "MERGING_RESOLVED"

    invoke-direct {v0, v1, v6}, Lorg/eclipse/jgit/lib/RepositoryState$4;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/lib/RepositoryState;->MERGING_RESOLVED:Lorg/eclipse/jgit/lib/RepositoryState;

    .line 150
    new-instance v0, Lorg/eclipse/jgit/lib/RepositoryState$5;

    const-string v1, "CHERRY_PICKING"

    invoke-direct {v0, v1, v7}, Lorg/eclipse/jgit/lib/RepositoryState$5;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/lib/RepositoryState;->CHERRY_PICKING:Lorg/eclipse/jgit/lib/RepositoryState;

    .line 174
    new-instance v0, Lorg/eclipse/jgit/lib/RepositoryState$6;

    const-string v1, "CHERRY_PICKING_RESOLVED"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/lib/RepositoryState$6;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/lib/RepositoryState;->CHERRY_PICKING_RESOLVED:Lorg/eclipse/jgit/lib/RepositoryState;

    .line 196
    new-instance v0, Lorg/eclipse/jgit/lib/RepositoryState$7;

    const-string v1, "REVERTING"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/lib/RepositoryState$7;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/lib/RepositoryState;->REVERTING:Lorg/eclipse/jgit/lib/RepositoryState;

    .line 220
    new-instance v0, Lorg/eclipse/jgit/lib/RepositoryState$8;

    const-string v1, "REVERTING_RESOLVED"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/lib/RepositoryState$8;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/lib/RepositoryState;->REVERTING_RESOLVED:Lorg/eclipse/jgit/lib/RepositoryState;

    .line 243
    new-instance v0, Lorg/eclipse/jgit/lib/RepositoryState$9;

    const-string v1, "REBASING"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/lib/RepositoryState$9;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/lib/RepositoryState;->REBASING:Lorg/eclipse/jgit/lib/RepositoryState;

    .line 266
    new-instance v0, Lorg/eclipse/jgit/lib/RepositoryState$10;

    const-string v1, "REBASING_REBASING"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/lib/RepositoryState$10;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/lib/RepositoryState;->REBASING_REBASING:Lorg/eclipse/jgit/lib/RepositoryState;

    .line 289
    new-instance v0, Lorg/eclipse/jgit/lib/RepositoryState$11;

    const-string v1, "APPLY"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/lib/RepositoryState$11;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/lib/RepositoryState;->APPLY:Lorg/eclipse/jgit/lib/RepositoryState;

    .line 312
    new-instance v0, Lorg/eclipse/jgit/lib/RepositoryState$12;

    const-string v1, "REBASING_MERGE"

    const/16 v2, 0xb

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/lib/RepositoryState$12;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/lib/RepositoryState;->REBASING_MERGE:Lorg/eclipse/jgit/lib/RepositoryState;

    .line 335
    new-instance v0, Lorg/eclipse/jgit/lib/RepositoryState$13;

    const-string v1, "REBASING_INTERACTIVE"

    const/16 v2, 0xc

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/lib/RepositoryState$13;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/lib/RepositoryState;->REBASING_INTERACTIVE:Lorg/eclipse/jgit/lib/RepositoryState;

    .line 358
    new-instance v0, Lorg/eclipse/jgit/lib/RepositoryState$14;

    const-string v1, "BISECTING"

    const/16 v2, 0xd

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/lib/RepositoryState$14;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/lib/RepositoryState;->BISECTING:Lorg/eclipse/jgit/lib/RepositoryState;

    .line 57
    const/16 v0, 0xe

    new-array v0, v0, [Lorg/eclipse/jgit/lib/RepositoryState;

    sget-object v1, Lorg/eclipse/jgit/lib/RepositoryState;->BARE:Lorg/eclipse/jgit/lib/RepositoryState;

    aput-object v1, v0, v3

    sget-object v1, Lorg/eclipse/jgit/lib/RepositoryState;->SAFE:Lorg/eclipse/jgit/lib/RepositoryState;

    aput-object v1, v0, v4

    sget-object v1, Lorg/eclipse/jgit/lib/RepositoryState;->MERGING:Lorg/eclipse/jgit/lib/RepositoryState;

    aput-object v1, v0, v5

    sget-object v1, Lorg/eclipse/jgit/lib/RepositoryState;->MERGING_RESOLVED:Lorg/eclipse/jgit/lib/RepositoryState;

    aput-object v1, v0, v6

    sget-object v1, Lorg/eclipse/jgit/lib/RepositoryState;->CHERRY_PICKING:Lorg/eclipse/jgit/lib/RepositoryState;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lorg/eclipse/jgit/lib/RepositoryState;->CHERRY_PICKING_RESOLVED:Lorg/eclipse/jgit/lib/RepositoryState;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lorg/eclipse/jgit/lib/RepositoryState;->REVERTING:Lorg/eclipse/jgit/lib/RepositoryState;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lorg/eclipse/jgit/lib/RepositoryState;->REVERTING_RESOLVED:Lorg/eclipse/jgit/lib/RepositoryState;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lorg/eclipse/jgit/lib/RepositoryState;->REBASING:Lorg/eclipse/jgit/lib/RepositoryState;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lorg/eclipse/jgit/lib/RepositoryState;->REBASING_REBASING:Lorg/eclipse/jgit/lib/RepositoryState;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lorg/eclipse/jgit/lib/RepositoryState;->APPLY:Lorg/eclipse/jgit/lib/RepositoryState;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lorg/eclipse/jgit/lib/RepositoryState;->REBASING_MERGE:Lorg/eclipse/jgit/lib/RepositoryState;

    aput-object v2, v0, v1

    const/16 v1, 0xc

    sget-object v2, Lorg/eclipse/jgit/lib/RepositoryState;->REBASING_INTERACTIVE:Lorg/eclipse/jgit/lib/RepositoryState;

    aput-object v2, v0, v1

    const/16 v1, 0xd

    sget-object v2, Lorg/eclipse/jgit/lib/RepositoryState;->BISECTING:Lorg/eclipse/jgit/lib/RepositoryState;

    aput-object v2, v0, v1

    sput-object v0, Lorg/eclipse/jgit/lib/RepositoryState;->$VALUES:[Lorg/eclipse/jgit/lib/RepositoryState;

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
    .line 57
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;ILorg/eclipse/jgit/lib/RepositoryState$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 57
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/lib/RepositoryState;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/eclipse/jgit/lib/RepositoryState;
    .locals 1
    .parameter "name"

    .prologue
    .line 57
    const-class v0, Lorg/eclipse/jgit/lib/RepositoryState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/lib/RepositoryState;

    return-object v0
.end method

.method public static values()[Lorg/eclipse/jgit/lib/RepositoryState;
    .locals 1

    .prologue
    .line 57
    sget-object v0, Lorg/eclipse/jgit/lib/RepositoryState;->$VALUES:[Lorg/eclipse/jgit/lib/RepositoryState;

    invoke-virtual {v0}, [Lorg/eclipse/jgit/lib/RepositoryState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/eclipse/jgit/lib/RepositoryState;

    return-object v0
.end method


# virtual methods
.method public abstract canAmend()Z
.end method

.method public abstract canCheckout()Z
.end method

.method public abstract canCommit()Z
.end method

.method public abstract canResetHead()Z
.end method

.method public abstract getDescription()Ljava/lang/String;
.end method

.method public abstract isRebasing()Z
.end method
