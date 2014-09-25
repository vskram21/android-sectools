.class public final enum Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;
.super Ljava/lang/Enum;
.source "DiffEntry.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/diff/DiffEntry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ChangeType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

.field public static final enum ADD:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

.field public static final enum COPY:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

.field public static final enum DELETE:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

.field public static final enum MODIFY:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

.field public static final enum RENAME:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 73
    new-instance v0, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    const-string v1, "ADD"

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->ADD:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    .line 76
    new-instance v0, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    const-string v1, "MODIFY"

    invoke-direct {v0, v1, v3}, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->MODIFY:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    .line 79
    new-instance v0, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    const-string v1, "DELETE"

    invoke-direct {v0, v1, v4}, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->DELETE:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    .line 82
    new-instance v0, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    const-string v1, "RENAME"

    invoke-direct {v0, v1, v5}, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->RENAME:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    .line 85
    new-instance v0, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    const-string v1, "COPY"

    invoke-direct {v0, v1, v6}, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->COPY:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    .line 71
    const/4 v0, 0x5

    new-array v0, v0, [Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    sget-object v1, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->ADD:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    aput-object v1, v0, v2

    sget-object v1, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->MODIFY:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    aput-object v1, v0, v3

    sget-object v1, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->DELETE:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    aput-object v1, v0, v4

    sget-object v1, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->RENAME:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    aput-object v1, v0, v5

    sget-object v1, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->COPY:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    aput-object v1, v0, v6

    sput-object v0, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->$VALUES:[Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

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
    .line 71
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;
    .locals 1
    .parameter "name"

    .prologue
    .line 71
    const-class v0, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    return-object v0
.end method

.method public static values()[Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;
    .locals 1

    .prologue
    .line 71
    sget-object v0, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->$VALUES:[Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    invoke-virtual {v0}, [Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    return-object v0
.end method
