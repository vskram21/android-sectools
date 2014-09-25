.class public final enum Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;
.super Ljava/lang/Enum;
.source "RebaseTodoLine.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/lib/RebaseTodoLine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Action"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

.field public static final enum COMMENT:Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

.field public static final enum EDIT:Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

.field public static final enum FIXUP:Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

.field public static final enum PICK:Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

.field public static final enum REWORD:Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

.field public static final enum SQUASH:Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;


# instance fields
.field private final shortToken:Ljava/lang/String;

.field private final token:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .prologue
    const/4 v9, 0x4

    const/4 v8, 0x3

    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 63
    new-instance v0, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    const-string v1, "PICK"

    const-string v2, "pick"

    const-string v3, "p"

    invoke-direct {v0, v1, v5, v2, v3}, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;->PICK:Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    .line 66
    new-instance v0, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    const-string v1, "REWORD"

    const-string v2, "reword"

    const-string v3, "r"

    invoke-direct {v0, v1, v6, v2, v3}, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;->REWORD:Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    .line 69
    new-instance v0, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    const-string v1, "EDIT"

    const-string v2, "edit"

    const-string v3, "e"

    invoke-direct {v0, v1, v7, v2, v3}, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;->EDIT:Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    .line 72
    new-instance v0, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    const-string v1, "SQUASH"

    const-string v2, "squash"

    const-string v3, "s"

    invoke-direct {v0, v1, v8, v2, v3}, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;->SQUASH:Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    .line 75
    new-instance v0, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    const-string v1, "FIXUP"

    const-string v2, "fixup"

    const-string v3, "f"

    invoke-direct {v0, v1, v9, v2, v3}, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;->FIXUP:Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    .line 81
    new-instance v0, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    const-string v1, "COMMENT"

    const/4 v2, 0x5

    const-string v3, "comment"

    const-string v4, "#"

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;->COMMENT:Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    .line 60
    const/4 v0, 0x6

    new-array v0, v0, [Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    sget-object v1, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;->PICK:Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    aput-object v1, v0, v5

    sget-object v1, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;->REWORD:Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    aput-object v1, v0, v6

    sget-object v1, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;->EDIT:Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    aput-object v1, v0, v7

    sget-object v1, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;->SQUASH:Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    aput-object v1, v0, v8

    sget-object v1, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;->FIXUP:Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    aput-object v1, v0, v9

    const/4 v1, 0x5

    sget-object v2, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;->COMMENT:Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    aput-object v2, v0, v1

    sput-object v0, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;->$VALUES:[Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter
    .parameter "token"
    .parameter "shortToken"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 87
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 88
    iput-object p3, p0, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;->token:Ljava/lang/String;

    .line 89
    iput-object p4, p0, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;->shortToken:Ljava/lang/String;

    .line 90
    return-void
.end method

.method static synthetic access$000(Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;)Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 61
    iget-object v0, p0, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;->token:Ljava/lang/String;

    return-object v0
.end method

.method public static parse(Ljava/lang/String;)Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;
    .locals 9
    .parameter "token"

    .prologue
    .line 109
    invoke-static {}, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;->values()[Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    move-result-object v1

    .local v1, arr$:[Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;
    array-length v3, v1

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_2

    aget-object v0, v1, v2

    .line 110
    .local v0, action:Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;
    iget-object v4, v0, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;->token:Ljava/lang/String;

    invoke-virtual {v4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    iget-object v4, v0, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;->shortToken:Ljava/lang/String;

    invoke-virtual {v4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 112
    :cond_0
    return-object v0

    .line 109
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 114
    .end local v0           #action:Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;
    :cond_2
    new-instance v4, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v5

    iget-object v5, v5, Lorg/eclipse/jgit/internal/JGitText;->unknownOrUnsupportedCommand:Ljava/lang/String;

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object p0, v6, v7

    const/4 v7, 0x1

    invoke-static {}, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;->values()[Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;
    .locals 1
    .parameter "name"

    .prologue
    .line 60
    const-class v0, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    return-object v0
.end method

.method public static values()[Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;
    .locals 1

    .prologue
    .line 60
    sget-object v0, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;->$VALUES:[Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    invoke-virtual {v0}, [Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 101
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Action["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;->token:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toToken()Ljava/lang/String;
    .locals 1

    .prologue
    .line 96
    iget-object v0, p0, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;->token:Ljava/lang/String;

    return-object v0
.end method
