component {

	function expressionModel(
		string detail        = "",
		numeric ErrNumber    = 0,
		numeric ErrorCode    = 0,
		string Extended_Info = "",
		string ExtendedInfo  = "",
		string Message       = "",
		string StackTrace    = "",
		array tagContext     = [],
		string type          = ""
	){
		return {
			"Detail"        : arguments.detail,
			"ErrNumber"     : arguments.errnumber,
			"ErrorCode"     : arguments.errorcode,
			"Extended_Info" : arguments.Extended_Info,
			"ExtendedInfo"  : arguments.ExtendedInfo,
			"Message"       : arguments.Message,
			"StackTrace"    : arguments.StackTrace,
			"TagContext"    : arguments.tagContext,
			"type"          : arguments.type
		};
	}

	function tagContextModel(
		string codePrintHTML  = "",
		string codePrintPlain = "",
		numeric column        = 0,
		string id             = "",
		numeric line          = 0,
		string Raw_Trace      = "",
		string template       = "",
		string type           = ""
	){
		return {
			"codePrintHTML"  : arguments.codePrintHTML,
			"codePrintPlain" : arguments.codePrintPlain,
			"column"         : arguments.column,
			"id"             : arguments.id,
			"line"           : arguments.line,
			"Raw_Trace"      : arguments.Raw_Trace,
			"template"       : arguments.template,
			"type"           : arguments.type
		};
	}

	function databaseModel(
		struct additional       = {},
		string Datasource       = "",
		string Detail           = "",
		numeric ErrorCode       = 0,
		string Extended_Info    = "",
		string ExtendedInfo     = "",
		string Message          = "",
		numeric NativeErrorCode = -1,
		string queryError       = "",
		string Sql              = "",
		string SQLState         = "",
		string StackTrace       = "",
		array tagContext        = [],
		string type             = "",
		string where            = ""
	){
		return {
			"additional"      : arguments.additional,
			"Datasource"      : arguments.datasource,
			"Detail"          : arguments.detail,
			"ErrorCode"       : arguments.ErrorCode,
			"Extended_Info"   : arguments.Extended_Info,
			"ExtendedInfo"    : arguments.ExtendedInfo,
			"message"         : arguments.message,
			"NativeErrorCode" : arguments.NativeErrorCode,
			"queryError"      : arguments.queryError,
			"sql"             : arguments.sql,
			"SQLState"        : arguments.SQLState,
			"StackTrace"      : arguments.StackTrace,
			"tagContext"      : arguments.tagContext,
			"type"            : arguments.type,
			"where"           : arguments.where
		};
	}

}
